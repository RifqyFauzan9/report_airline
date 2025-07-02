import 'package:flutter/material.dart';
import 'package:report_airline/static/routes.dart';
import 'package:report_airline/static/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(context, AppRoute.loginScreen.route),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(getPropScreenWidth(64)),
          child: Hero(
            tag: 'splash-animation',
            child: Image.asset('assets/images/sriwijaya_air_logo.png'),
          ),
        ),
      ),
    );
  }
}
