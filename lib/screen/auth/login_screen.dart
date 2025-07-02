import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:report_airline/static/routes.dart';
import 'package:report_airline/static/size_config.dart';

import '../../static/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObsecurePass = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LM Control Report',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.12),
                _logoSection(),
                const SizedBox(height: 24),
                _formSection(),
              ],
            ),
          ),
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
          ),
          const SizedBox(height: 16),
          _isLoading
              ? LoadingAnimationWidget.discreteCircle(
                  color: AppColor.primary.color,
                  size: getPropScreenWidth(40),
                )
              : FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() => _isLoading = true);
                      Future.delayed(Duration(milliseconds: 1500), () {
                        setState(() => _isLoading = false);
                      }).then(
                        (_) => Navigator.pushNamed(
                          context,
                          AppRoute.homeScreen.route,
                        ),
                      );
                    }
                  },
                  child: const Text('LOGIN'),
                ),
        ],
      ),
    );
  }
}
