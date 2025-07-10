import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/firebase_auth_provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';
import 'package:report_airline/provider/shared_preferences_provider.dart';
import 'package:report_airline/service/firebase_auth_service.dart';
import 'package:report_airline/service/shared_preferences_service.dart';
import 'package:report_airline/static/colors.dart';
import 'package:report_airline/static/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final pref = await SharedPreferences.getInstance();
  final firebaseAuth = FirebaseAuth.instance;

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => FirebaseAuthService(firebaseAuth)),
        Provider(create: (context) => SharedPreferencesService(pref)),

        ChangeNotifierProvider(create: (context) => LmcrProvider()),
        ChangeNotifierProvider(
          create: (context) => SharedPreferencesProvider(
            context.read<SharedPreferencesService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              FirebaseAuthProvider(context.read<FirebaseAuthService>()),
        ),
      ],
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
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          textStyle: Theme.of(
            context,
          ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 60,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: 13),
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
