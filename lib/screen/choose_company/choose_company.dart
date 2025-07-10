import 'package:flutter/material.dart';
import 'package:report_airline/static/colors.dart';
import 'package:report_airline/static/form_type.dart';
import 'package:report_airline/static/routes.dart';

class ChooseCompanyScreen extends StatelessWidget {
  const ChooseCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
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
                  CompanyLabel(label: 'SERVICE CHECK', onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.mainScreen.route,
                      arguments: FormType.sriwijayaServiceCheck,
                    );
                  }),
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
                  CompanyLabel(label: 'TRANSIT CHECK', onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.mainScreen.route,
                      arguments: FormType.sriwijayaTransit,
                    );
                  }),
                ],
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
              CompanyCard(
                companyName: 'NAM Air',
                companyLogo: 'assets/images/nam_air_logo.png',
                labels: [
                  CompanyLabel(label: 'DAILY INSPECTION CHECK', onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.mainScreen.route,
                      arguments: FormType.namDailyInspection,
                    );
                  }),
                  CompanyLabel(label: 'PRE-FLIGHT CHECK', onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.mainScreen.route,
                      arguments: FormType.namPreFlight,
                    );
                  }),
                  CompanyLabel(label: 'TRANSIT CHECK', onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoute.mainScreen.route,
                      arguments: FormType.namTransit,
                    );
                  }),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
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
