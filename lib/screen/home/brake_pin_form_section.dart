import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

class BrakePinFormSection extends StatefulWidget {
  const BrakePinFormSection({super.key});

  @override
  State<BrakePinFormSection> createState() => _BrakePinFormSectionState();
}

class _BrakePinFormSectionState extends State<BrakePinFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _pin1Controller = TextEditingController();
  final _pin2Controller = TextEditingController();
  final _pin3Controller = TextEditingController();
  final _pin4Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _pin1Controller.dispose();
    _pin2Controller.dispose();
    _pin3Controller.dispose();
    _pin4Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle fieldLabelStyle = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);
    final provider = context.read<LmcrProvider>();

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wear Brake Pin (mm)', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _pin1Controller,
                  decoration: InputDecoration(labelText: 'Pin 1 (mm)'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => provider.updatePin1(
                    double.tryParse(value) ?? 0.0
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _pin2Controller,
                  decoration: InputDecoration(labelText: 'Pin 2 (mm)'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => provider.updatePin2(
                    double.tryParse(value) ?? 0.0
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _pin3Controller,
                  decoration: InputDecoration(labelText: 'Pin 3 (mm)'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => provider.updatePin3(double.tryParse(value) ?? 0.0),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _pin4Controller,
                  decoration: InputDecoration(labelText: 'Pin 4 (mm)'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) => provider.updatePin4(double.tryParse(value) ?? 0.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
