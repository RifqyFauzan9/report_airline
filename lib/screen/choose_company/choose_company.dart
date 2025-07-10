import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/firebase_auth_provider.dart';
import 'package:report_airline/provider/shared_preferences_provider.dart';
import 'package:report_airline/static/colors.dart';
import 'package:report_airline/static/firebase_auth_status.dart';
import 'package:report_airline/static/form_type.dart';
import 'package:report_airline/static/routes.dart';

class ChooseCompanyScreen extends StatelessWidget {
  const ChooseCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildLogoutButton(),
        title: Text(
          'Choose Company',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CompanyCard(
                companyName: 'Sriwijaya Air',
                companyLogo: 'assets/images/sriwijaya_air_logo.png',
                labels: [
                  CompanyLabel(
                    label: 'SERVICE CHECK',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.mainScreen.route,
                        arguments: FormType.sriwijayaServiceCheck,
                      );
                    },
                  ),
                  CompanyLabel(
                    label: 'PRE-DEPARTURE CHECK',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.mainScreen.route,
                        arguments: FormType.sriwijayaPreDeparture,
                      );
                    },
                  ),
                  CompanyLabel(
                    label: 'TRANSIT CHECK',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.mainScreen.route,
                        arguments: FormType.sriwijayaTransit,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              CompanyCard(
                companyName: 'NAM Air',
                companyLogo: 'assets/images/nam_air_logo.png',
                labels: [
                  CompanyLabel(
                    label: 'DAILY INSPECTION CHECK',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.mainScreen.route,
                        arguments: FormType.namDailyInspection,
                      );
                    },
                  ),
                  CompanyLabel(
                    label: 'PRE-FLIGHT CHECK',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.mainScreen.route,
                        arguments: FormType.namPreFlight,
                      );
                    },
                  ),
                  CompanyLabel(
                    label: 'TRANSIT CHECK',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.mainScreen.route,
                        arguments: FormType.namTransit,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Consumer<FirebaseAuthProvider> buildLogoutButton() {
    return Consumer<FirebaseAuthProvider>(
      builder: (context, value, child) {
        final navigator = Navigator.of(context);
        return switch (value.authStatus) {
          FirebaseAuthStatus.signingOut =>
            LoadingAnimationWidget.discreteCircle(
              color: AppColor.primary.color,
              size: 24,
            ),
          _ => IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Sign Out'),
                    content: Text('Are you sure to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          navigator.pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          navigator.pop;
                          _tapToSignOut(context);
                        },
                        child: Text(
                          'Yes',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(CupertinoIcons.square_arrow_left),
          ),
        };
      },
    );
  }
}

void _tapToSignOut(BuildContext context) async {
  final sharedPreferencesProvider = context.read<SharedPreferencesProvider>();
  final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
  final navigator = Navigator.of(context);

  await firebaseAuthProvider.signOutUser();
  switch (firebaseAuthProvider.authStatus) {
    case FirebaseAuthStatus.unauthenticated:
      await sharedPreferencesProvider.logout();
      navigator.pushReplacementNamed(AppRoute.loginScreen.route);
    case _:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(firebaseAuthProvider.message ?? 'Failed to sign out'),
        ),
      );
  }
}

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.companyName,
    required this.companyLogo,
    required this.labels,
  });

  final String companyName, companyLogo;
  final List<CompanyLabel> labels;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildContent(context),
              const SizedBox(height: 10),
              Text(
                '$companyName Form',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary.color.withOpacity(0.6),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 110,
              minHeight: 110,
              maxWidth: 110,
              minWidth: 110,
            ),
            child: Image.asset(companyLogo, fit: BoxFit.cover),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.015),
          ...labels.map((l) => l),
        ],
      ),
    );
  }
}

class CompanyLabel extends StatelessWidget {
  const CompanyLabel({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColor.primary.color,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
