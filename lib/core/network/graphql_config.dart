import 'package:finatmo/core/storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:gql/language.dart';

class GraphqlConfig {
  late GraphQLClient client;
  final SecureStorage secureStorage;

  GraphqlConfig({required this.secureStorage}) {
    final url = dotenv.env['BASE_URL_GRAPHQL']!;
    final httpLink = HttpLink(url);

    final authLink = AuthLink(
      getToken: () async {
        final token = await secureStorage.getAccessToken();
        return token != null ? 'Bearer $token' : null;
      },
    );

    final logLink = Link.function((request, [forward]) async* {
      debugPrint('🟣 GRAPHQL REQUEST');
      debugPrint(request.operation.operationName);
      debugPrint(printNode(request.operation.document));
      debugPrint('variables: ${request.variables}');

      final responseStream = forward!(request);

      await for (final response in responseStream) {
        debugPrint('🟢 GRAPHQL RESPONSE');
        debugPrint(response.data.toString());

        if (response.errors != null) {
          debugPrint('🔴 GRAPHQL ERRORS');
          debugPrint(response.errors.toString());
        }

        yield response;
      }
    });

    final link = authLink.concat(logLink).concat(httpLink);

    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
