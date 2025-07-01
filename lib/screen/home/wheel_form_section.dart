import 'package:flutter/material.dart';

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
                  decoration: InputDecoration(
                    hintText: 'Wheel 1 Condition (%)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _psi1Controller,
                  decoration: InputDecoration(
                    hintText: 'Wheel 1 Pressure (PSI)',
                  ),
                  keyboardType: TextInputType.number,
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
                    hintText: 'Wheel 2 Condition (%)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _psi2Controller,
                  decoration: InputDecoration(
                    hintText: 'Wheel 2 Pressure (PSI)',
                  ),
                  keyboardType: TextInputType.number,
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
                    hintText: 'Wheel 3 Condition (%)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _psi3Controller,
                  decoration: InputDecoration(
                    hintText: 'Wheel 3 Pressure (PSI)',
                  ),
                  keyboardType: TextInputType.number,
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
                    hintText: 'Wheel 4 Condition (%)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: _psi4Controller,
                  decoration: InputDecoration(
                    hintText: 'Wheel 4 Pressure (PSI)',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}