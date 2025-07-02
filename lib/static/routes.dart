import 'package:flutter/material.dart';
import 'package:report_airline/screen/auth/login_screen.dart';
import 'package:report_airline/screen/choose_company/choose_company.dart';
import 'package:report_airline/screen/choose_form/choose_main_form.dart';
import 'package:report_airline/screen/home/home_screen.dart';
import 'package:report_airline/screen/splash/splash_screen.dart';

enum AppRoute {
  splash('/'),
  loginScreen('/login'),
  homeScreen('/home'),
  chooseCompany('/chooseCompany'),
  chooseMainForm('/chooseMainForm'),
  namChooseForm('/namChooseForm'),
  sriwijayaChooseForm('/sriwijayaChooseForm');

  final String route;
  const AppRoute(this.route);
}

Map<String, WidgetBuilder> routes = {
  AppRoute.splash.route: (context) => SplashScreen(),
  AppRoute.loginScreen.route: (context) => LoginScreen(),
  AppRoute.homeScreen.route: (context) => HomeScreen(),
  AppRoute.chooseCompany.route: (context) => ChooseCompanyScreen(),
  AppRoute.chooseMainForm.route: (context) => ChooseMainFormScreen(),
  AppRoute.namChooseForm.route: (context) => ChooseMainFormScreen(),
  AppRoute.sriwijayaChooseForm.route: (context) => ChooseMainFormScreen(),
};