import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

class FluidsFormSection extends StatefulWidget {
  const FluidsFormSection({super.key});

  @override
  State<FluidsFormSection> createState() => _FluidsFormSectionState();
}

class _FluidsFormSectionState extends State<FluidsFormSection> {
  final _formKey = GlobalKey<FormState>();

  final _engController = TextEditingController();
  final _oilEngController = TextEditingController();
  final _idgController = TextEditingController();
  final _oilIdgController = TextEditingController();
  final _apuOilController = TextEditingController();
  final _hydController = TextEditingController();
  final _fluidController = TextEditingController();
  final _oxygenPsiController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _engController.dispose();
    _oilEngController.dispose();
    _idgController.dispose();
    _oilIdgController.dispose();
    _apuOilController.dispose();
    _hydController.dispose();
    _fluidController.dispose();
    _oxygenPsiController.dispose();
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
          Text('ENG OIL', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _engController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ENG OIL Before (QRT)',
                  ),
                  onChanged: (value) =>
                      provider.updateEngOilBefore(int.tryParse(value) ?? 0),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _oilEngController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'ENG OIL After (QRT)'),
                  onChanged: (value) =>
                      provider.updateEngOilAfter(int.tryParse(value) ?? 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('IDG OIL', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _idgController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'IDG OIL Before (QRT)',
                  ),
                  onChanged: (value) =>
                      provider.updateIdgOilBefore(int.tryParse(value) ?? 0),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _oilIdgController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'IDG OIL After (QRT)'),
                  onChanged: (value) =>
                      provider.updateIdgOilAfter(int.tryParse(value) ?? 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('APU OIL', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _apuOilController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'APU OIL (QRT)'),
            onChanged: (value) =>
                provider.updateApuOil(int.tryParse(value) ?? 0),
          ),
          const SizedBox(height: 16),
          Text('HYD FLUID', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _hydController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'HYD FLUID Before (QRT)',
                  ),
                  onChanged: (value) =>
                      provider.updateHydFluidBefore(int.tryParse(value) ?? 0),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _fluidController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'HYD FLUID After (QRT)',
                  ),
                  onChanged: (value) =>
                      provider.updateHydFluidAfter(int.tryParse(value) ?? 0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text('OXYGEN PSI', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            controller: _oxygenPsiController,
            decoration: InputDecoration(labelText: 'Input OXYGEN PSI'),
            onChanged: (value) =>
                provider.updateOxygen(int.tryParse(value)?.toDouble() ?? 0),
          ),
        ],
      ),
    );
  }
}
