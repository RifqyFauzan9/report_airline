import 'package:flutter/material.dart';
import 'package:report_airline/static/colors.dart';
import 'package:report_airline/static/routes.dart';
import 'package:report_airline/static/size_config.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                CompanyCard(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoute.homeScreen.route,
                  ),
                  companyName: 'Sriwijaya Air',
                  companyLogo: 'assets/images/sriwijaya_air_logo.png',
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                CompanyCard(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRoute.homeScreen.route,
                  ),
                  companyName: 'NAM Air',
                  companyLogo: 'assets/images/nam_air_logo.png',
                ),
              ],
            ),
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
    required this.onTap,
  });

  final String companyName, companyLogo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
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
    );
  }

  Container buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 50,
                  minHeight: 50,
                  maxWidth: 50,
                  minWidth: 50,
                ),
                child: Image.asset(companyLogo, fit: BoxFit.cover),
              ),
              const SizedBox(width: 8),
              Text(
                companyName,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$companyName form',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.primary.color,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Active Form: 3',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary.color.withOpacity(0.6),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CompanyLabel(label: 'AIRLINE'),
              const SizedBox(width: 8),
              CompanyLabel(label: 'LMCR'),
              const SizedBox(width: 8),
              CompanyLabel(label: 'FORM'),
            ],
          ),
        ],
      ),
    );
  }
}

class CompanyLabel extends StatelessWidget {
  const CompanyLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: AppColor.primary.color.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: AppColor.primary.color,
        ),
      ),
    );
  }
}
