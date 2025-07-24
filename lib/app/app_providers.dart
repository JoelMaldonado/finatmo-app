import 'package:finatmo/di/di.dart';
import 'package:finatmo/presentation/pages/add_loan/add_loan_provider.dart';
import 'package:finatmo/presentation/pages/add_movement/add_movement_provider.dart';
import 'package:finatmo/presentation/pages/login/login_provider.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProviders() {
  return [
    // Ui
    ChangeNotifierProvider(create: (_) => getIt<LoginProvider>()),
    ChangeNotifierProvider(create: (_) => getIt<AddLoanProvider>()),
    ChangeNotifierProvider(create: (_) => getIt<AddMovementProvider>()),
    // Shared
    ChangeNotifierProvider(create: (_) => getIt<LoanProvider>()),
  ];
}
