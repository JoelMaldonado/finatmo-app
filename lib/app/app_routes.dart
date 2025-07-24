import 'package:finatmo/presentation/pages/daily_expenses_page.dart';
import 'package:finatmo/presentation/pages/home/home_page.dart';
import 'package:finatmo/presentation/pages/incomes_page.dart';
import 'package:finatmo/presentation/pages/loan_list_page.dart';
import 'package:finatmo/presentation/pages/login/login_page.dart';
import 'package:finatmo/presentation/pages/summary_page.dart';

const initialRoute = AppRoutes.login;

class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';
  static const String dailyExpenses = '/daily-expenses';
  static const String incomes = '/incomes';
  static const String loanList = '/loan-list';
  static const String loanPayments = '/loan-payments';
  static const String summary = '/summary';

  static get routes => {
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.home: (context) => HomePage(),
    AppRoutes.dailyExpenses: (context) => DailyExpensesPage(),
    AppRoutes.incomes: (context) => IncomesPage(),
    AppRoutes.loanList: (context) => LoanListPage(),
    AppRoutes.summary: (context) => SummaryPage(),
  };
}
