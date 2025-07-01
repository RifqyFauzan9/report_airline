import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:report_airline/screen/home/pirep_dmi_form_section.dart';
import 'package:report_airline/screen/home/submit_section.dart';
import 'package:report_airline/screen/home/wheel_form_section.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Stepper(
              currentStep: _currentStep,
              onStepContinue: () {
                if (_currentStep < 6) {
                  setState(() => _currentStep++);
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
                Step(title: Text('Fluids & Oil'), content: FluidsFormSection()),
                Step(title: Text('Brake Pin'), content: BrakePinFormSection()),
                Step(title: Text('Wheels'), content: WheelFormSection()),
                Step(title: Text('APU / FAK'), content: ApuFakFormSection()),
                Step(title: Text('Confirmation'), content: SubmitSection()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
