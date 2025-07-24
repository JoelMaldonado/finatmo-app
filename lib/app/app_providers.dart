import 'package:finatmo/di/di.dart';
import 'package:finatmo/presentation/pages/login/login_provider.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders() {
  return [
    // Ui
    ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
    // Shared
    ChangeNotifierProvider(create: (_) => getIt<LoanProvider>()),
  ];
}
