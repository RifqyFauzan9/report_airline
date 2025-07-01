import 'package:flutter/material.dart';
import 'package:report_airline/screen/home/home_screen.dart';

enum AppRoute {
  homeScreen('/');

  final String route;
  const AppRoute(this.route);
}

Map<String, WidgetBuilder> routes = {
  AppRoute.homeScreen.route: (context) => HomeScreen(),
};