import 'package:finatmo/presentation/pages/daily_expenses_page.dart';
import 'package:finatmo/presentation/pages/home_page.dart';
import 'package:finatmo/presentation/pages/incomes_page.dart';
import 'package:finatmo/presentation/pages/loan_detail_page.dart';
import 'package:finatmo/presentation/pages/loan_list_page.dart';
import 'package:finatmo/presentation/pages/summary_page.dart';
import 'package:finatmo/app/app_routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
