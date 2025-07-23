import 'package:finatmo/presentation/pages/daily_expenses_page.dart';
import 'package:finatmo/presentation/pages/home_page.dart';
import 'package:finatmo/presentation/pages/incomes_page.dart';
import 'package:finatmo/presentation/pages/loan_detail_page.dart';
import 'package:finatmo/presentation/pages/loan_list_page.dart';
import 'package:finatmo/presentation/pages/summary_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String dailyExpenses = '/daily-expenses';
  static const String incomes = '/incomes';
  static const String loanList = '/loan-list';
  static const String loanDetail = '/loan-detail';
  static const String loanPayments = '/loan-payments';
  static const String summary = '/summary';

  static get routes => {
    AppRoutes.home: (context) => HomePage(),
    AppRoutes.dailyExpenses: (context) => DailyExpensesPage(),
    AppRoutes.incomes: (context) => IncomesPage(),
    AppRoutes.loanList: (context) => LoanListPage(),
    AppRoutes.loanDetail: (context) => LoanDetailPage(),
    AppRoutes.summary: (context) => SummaryPage(),
  };
}
