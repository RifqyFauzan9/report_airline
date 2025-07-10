import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

class SubmitSection extends StatefulWidget {
  const SubmitSection({super.key});

  @override
  State<SubmitSection> createState() => _SubmitSectionState();
}

class _SubmitSectionState extends State<SubmitSection> {
  final _formKey = GlobalKey<FormState>();
  final _refFormController = TextEditingController();

  final List<String> signers = ['LM NAM-E UPG', 'LM NAM-JKT', 'LM NAM-SUB'];

  @override
  void dispose() {
    super.dispose();
    _refFormController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _refFormController.text = 'REF FORM TE-028 REV.10';
    Future.microtask(() {
      final provider = context.read<LmcrProvider>();
      provider.updatePerformedServiceCode(_refFormController.text);
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
          Text('Performed Service Check', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(readOnly: true, controller: _refFormController),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            icon: Icon(CupertinoIcons.chevron_down),
            decoration: InputDecoration(labelText: 'Signed By / Unit'),
            items: signers
                .map(
                  (value) => DropdownMenuItem(value: value, child: Text(value)),
                )
                .toList(),
            onChanged: (value) {
             provider.updateSignedByOrUnit(value!);
            },
          ),
        ],
      ),
    );
  }
}
