import 'package:finatmo/core/network/graphql_config.dart';
import 'package:finatmo/data/model/dtos/loan_dto.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class LoanGraphqlService {
  final GraphqlConfig graphql;

  LoanGraphqlService({required this.graphql});

  Future<List<LoanContactDto>> getContacts() async {
    const query = '''
      query LoanContacts {
        loanContacts {
          id
          fullName
          phone
          email
          isActive
          notes
          createdAt
          updatedAt
        }
      }
    ''';

    final result = await graphql.client.query(
      QueryOptions(document: gql(query)),
    );

    if (result.hasException) {
      throw result.exception!;
    }

    return (result.data?['loanContacts'] as List<dynamic>?)
            ?.map((e) => LoanContactDto.fromJson(e))
            .toList() ??
        [];
  }
}
