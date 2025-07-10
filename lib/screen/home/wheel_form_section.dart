import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

class WheelFormSection extends StatefulWidget {
  const WheelFormSection({super.key});

  @override
  State<WheelFormSection> createState() => _WheelFormSectionState();
}

class _WheelFormSectionState extends State<WheelFormSection> {
  final _formKey = GlobalKey<FormState>();

  final _condition1Controller = TextEditingController();
  final _condition2Controller = TextEditingController();
  final _condition3Controller = TextEditingController();
  final _condition4Controller = TextEditingController();
  final _psi1Controller = TextEditingController();
  final _psi2Controller = TextEditingController();
  final _psi3Controller = TextEditingController();
  final _psi4Controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _condition1Controller.dispose();
    _condition2Controller.dispose();
    _condition3Controller.dispose();
    _condition4Controller.dispose();
    _psi1Controller.dispose();
    _psi2Controller.dispose();
    _psi3Controller.dispose();
    _psi4Controller.dispose();
  }

  void _updateWheelConditionToProvider() {
    final provider = context.read<LmcrProvider>();

    provider.updateWheelCondition({
      'wheel1_condition': int.tryParse(_condition1Controller.text) ?? 0,
      'wheel1_psi': int.tryParse(_psi1Controller.text) ?? 0,
      'wheel2_condition': int.tryParse(_condition2Controller.text) ?? 0,
      'wheel2_psi': int.tryParse(_psi2Controller.text) ?? 0,
      'wheel3_condition': int.tryParse(_condition3Controller.text) ?? 0,
      'wheel3_psi': int.tryParse(_psi3Controller.text) ?? 0,
      'wheel4_condition': int.tryParse(_condition4Controller.text) ?? 0,
      'wheel4_psi': int.tryParse(_psi4Controller.text) ?? 0,
    });
  }


  @override
  Widget build(BuildContext context) {
    final TextStyle fieldLabelStyle = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Wheel 1', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _condition1Controller,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Wheel 1 Condition (%)',
                  ),
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _psi1Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 1 Pressure (PSI)',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Wheel 2', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _condition2Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 2 Condition (%)',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _psi2Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 2 Pressure (PSI)',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Wheel 3', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _condition3Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 3 Condition (%)',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _psi3Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 3 Pressure (PSI)',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('Wheel 4', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _condition4Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 4 Condition (%)',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _psi4Controller,
                  decoration: InputDecoration(
                    labelText: 'Wheel 4 Pressure (PSI)',
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateWheelConditionToProvider(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}