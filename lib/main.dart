import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';
import 'package:report_airline/static/colors.dart';
import 'package:report_airline/static/routes.dart';
import 'package:report_airline/static/size_config.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LmcrProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LM Control Report',
      builder: (context, child) {
        SizeConfig().init(context);
        return child!;
      },
      theme: _lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash.route,
      routes: routes,
    );
  }

  ThemeData _lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorSchemeSeed: AppColor.primary.color,
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: Size(double.infinity, getPropScreenWidth(48)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: getPropScreenWidth(60),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: false,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: getPropScreenWidth(22),
          vertical: getPropScreenWidth(14),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.6),
        ),
        labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.6),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}
