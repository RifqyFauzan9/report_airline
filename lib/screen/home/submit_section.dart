import 'package:flutter/material.dart';

class SubmitSection extends StatefulWidget {
  const SubmitSection({super.key});

  @override
  State<SubmitSection> createState() => _SubmitSectionState();
}

class _SubmitSectionState extends State<SubmitSection> {
  final _formKey = GlobalKey<FormState>();
  final _refFormController = TextEditingController();

  final List<String> signers = ['LM NAM-E UPG', 'LM NAM-JKT', 'LM NAM-SUB'];
  String selectedSigner = 'LM NAM-E UPG';

  @override
  void dispose() {
    super.dispose();
    _refFormController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _refFormController.text = 'REF FORM TE-028 REV.10';
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
          Text('Performed Service Check', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(readOnly: true, controller: _refFormController),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(labelText: 'Signed By / Unit'),
            items: signers
                .map(
                  (value) => DropdownMenuItem(value: value, child: Text(value)),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedSigner = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
