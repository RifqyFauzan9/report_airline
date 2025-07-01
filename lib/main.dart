import 'package:flutter/material.dart';
import 'package:report_airline/static/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Color(0xFF323061),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeScreen.route,
      routes: routes,
    );
  }
}
