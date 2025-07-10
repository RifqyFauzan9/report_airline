import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

class PirepDmiFormSection extends StatefulWidget {
  const PirepDmiFormSection({super.key});

  @override
  State<PirepDmiFormSection> createState() => _PirepDmiFormSectionState();
}

class _PirepDmiFormSectionState extends State<PirepDmiFormSection> {
  final _formKey = GlobalKey<FormState>();

  final _pirepController = TextEditingController();
  final _actionController = TextEditingController();
  final _dmiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dmiController.text = 'NIL';

    Future.microtask(() {
      final provider = context.read<LmcrProvider>();
      provider.updateDmi(_dmiController.text);
    });
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
          Text('PIREP', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            minLines: 3,
            maxLines: 3,
            controller: _pirepController,
            decoration: InputDecoration(labelText: 'Input PIREP'),
            onChanged: (value) => provider.updatePirep(value),
          ),
          const SizedBox(height: 16),
          Text('ACTION', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            minLines: 3,
            maxLines: 3,
            controller: _actionController,
            decoration: InputDecoration(labelText: 'Input ACTION'),
            onChanged: (value) => provider.updateAction(value),
          ),
          const SizedBox(height: 16),
          Text('DMI', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            textCapitalization: TextCapitalization.sentences,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            controller: _dmiController,
            decoration: InputDecoration(labelText: 'Input DMI'),
            onChanged: (value) => provider.updateDmi(value),
          ),
        ],
      ),
    );
  }
}