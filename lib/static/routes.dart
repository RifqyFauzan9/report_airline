import 'package:flutter/material.dart';
import 'package:report_airline/screen/auth/login_screen.dart';
import 'package:report_airline/screen/choose_company/choose_company.dart';
import 'package:report_airline/screen/home/dynamic_form_screen.dart';
import 'package:report_airline/screen/splash/splash_screen.dart';
import 'package:report_airline/static/form_type.dart';

enum AppRoute {
  splash('/'),
  loginScreen('/login'),
  mainScreen('/main'),
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
  AppRoute.mainScreen.route: (context) => DynamicFormScreen(
    formType: ModalRoute.of(context)?.settings.arguments as FormType,
  ),
  AppRoute.chooseCompany.route: (context) => ChooseCompanyScreen(),
};