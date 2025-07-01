import 'package:flutter/material.dart';
import 'package:report_airline/screen/auth/login_screen.dart';
import 'package:report_airline/screen/home/home_screen.dart';

enum AppRoute {
  loginScreen('/'),
  homeScreen('/home');

  final String route;
  const AppRoute(this.route);
}

Map<String, WidgetBuilder> routes = {
  AppRoute.loginScreen.route: (context) => LoginScreen(),
  AppRoute.homeScreen.route: (context) => HomeScreen(),
};