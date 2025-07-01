import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:report_airline/screen/home/pirep_dmi_form_section.dart';
import 'package:report_airline/screen/home/submit_section.dart';
import 'package:report_airline/screen/home/wheel_form_section.dart';
import 'package:report_airline/static/colors.dart';

import 'apu_fak_form_section.dart';
import 'brake_pin_form_section.dart';
import 'fluids_form_section.dart';
import 'general_form_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 0;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LMCR Form',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: isLoading
          ? Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: AppColor.primary.color,
                size: 80,
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: () {
                  if (_currentStep < 6) {
                    setState(() => _currentStep++);
                  } else {
                    setState(() => isLoading = true);

                    Future.delayed(Duration(seconds: 2), () {
                      setState(() => isLoading = false);

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Report Submitted!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() => _currentStep--);
                  }
                },
                steps: [
                  Step(
                    title: Text('General Info'),
                    content: GeneralFormSection(),
                  ),
                  Step(
                    title: Text('PIREP / DMI'),
                    content: PirepDmiFormSection(),
                  ),
                  Step(
                    title: Text('Fluids & Oil'),
                    content: FluidsFormSection(),
                  ),
                  Step(
                    title: Text('Brake Pin'),
                    content: BrakePinFormSection(),
                  ),
                  Step(title: Text('Wheels'), content: WheelFormSection()),
                  Step(title: Text('APU / FAK'), content: ApuFakFormSection()),
                  Step(title: Text('Confirmation'), content: SubmitSection()),
                ],
              ),
            ),
    );
  }
}
