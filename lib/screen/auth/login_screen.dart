import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/firebase_auth_provider.dart';
import 'package:report_airline/provider/shared_preferences_provider.dart';
import 'package:report_airline/static/firebase_auth_status.dart';
import 'package:report_airline/static/routes.dart';

import '../../static/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObsecurePass = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.12),
                _logoSection(),
                const SizedBox(height: 24),
                _formSection(),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Hero(
          tag: 'splash-animation',
          child: Image.asset(
            'assets/images/airplane-icon.png',
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      title: Text(
        'LM Control Report',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

  Row _logoSection() {
    return Row(
      children: [
        Expanded(child: Image.asset('assets/images/sriwijaya_air_logo.png')),
        Expanded(child: Image.asset('assets/images/nam_air_logo.png')),
      ],
    );
  }

  Form _formSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'E-mail',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'E-mail must be filled!';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.sentences,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide(
                  width: 2,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              labelText: 'Password',
              suffixIcon: Container(
                margin: const EdgeInsets.only(right: 6),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _isObsecurePass = !_isObsecurePass;
                    });
                  },
                  icon: Icon(
                    _isObsecurePass
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                  ),
                ),
              ),
            ),
            obscureText: _isObsecurePass,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 6) {
                return 'Password must be at least 6 letters!';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              if (_formKey.currentState!.validate()) {
                _tapToLogin();
              }
            },
          ),
          const SizedBox(height: 16),
          Consumer<FirebaseAuthProvider>(
            builder: (context, value, child) {
              return switch (value.authStatus) {
                FirebaseAuthStatus.authenticating =>
                  LoadingAnimationWidget.discreteCircle(
                    color: AppColor.primary.color,
                    size: 32,
                  ),
                _ => FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _tapToLogin();
                    }
                  },
                  child: const Text('LOGIN'),
                ),
              };
            },
          ),
          const SizedBox(height: 12),
          _termsAndConditionsText(),
        ],
      ),
    );
  }

  void _tapToLogin() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
    final navigator = Navigator.of(context);

    await firebaseAuthProvider.signInUser(email, password);
    switch (firebaseAuthProvider.authStatus) {
      case FirebaseAuthStatus.authenticated:
        await sharedPreferencesProvider.login();
        navigator.pushReplacementNamed(AppRoute.chooseCompany.route);
      case _:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(firebaseAuthProvider.message ?? 'Failed to login'),
          ),
        );
    }
  }

  Widget _termsAndConditionsText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 13),
        children: [
          TextSpan(text: 'By signing in, you agree to our '),
          TextSpan(
            text: 'Terms',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primary.color,
            ),
          ),
          TextSpan(text: ' And '),
          TextSpan(
            text: 'Conditions',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColor.primary.color,
            ),
          ),
        ],
      ),
    );
  }
}
