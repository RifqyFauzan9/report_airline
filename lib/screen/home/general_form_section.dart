import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GeneralFormSection extends StatefulWidget {
  const GeneralFormSection({super.key});

  @override
  State<GeneralFormSection> createState() => _GeneralFormSectionState();
}

class _GeneralFormSectionState extends State<GeneralFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _dateUtcController = TextEditingController();
  final _acTypeController = TextEditingController();
  final _acRegController = TextEditingController();
  final _otrController = TextEditingController();
  final _releasedByController = TextEditingController();
  final _timeReleasedController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _dateUtcController.dispose();
    _acTypeController.dispose();
    _acRegController.dispose();
    _otrController.dispose();
    _releasedByController.dispose();
    _timeReleasedController.dispose();
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
          Text('Date (UTC)', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            controller: _dateUtcController,
            readOnly: true,
            decoration: InputDecoration(hintText: 'Input Date (UTC)'),
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2050),
              );
              if (pickedDate != null) {
                _dateUtcController.text = DateFormat(
                  'dd MMM yyyy',
                ).format(pickedDate);
              }
            },
          ),
          const SizedBox(height: 16),
          Text('A/C Type', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _acTypeController,
            decoration: InputDecoration(hintText: 'Input A/C Type'),
          ),
          const SizedBox(height: 16),
          Text('A/C Reg', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _acRegController,
            decoration: InputDecoration(hintText: 'Input A/C Reg'),
          ),
          const SizedBox(height: 16),
          Text('OTR', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _otrController,
            decoration: InputDecoration(hintText: 'Input OTR'),
          ),
          const SizedBox(height: 16),
          Text('Released By', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _releasedByController,
            decoration: InputDecoration(hintText: 'Input Released By'),
          ),
          const SizedBox(height: 16),
          Text('Time Released', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.done,
            controller: _timeReleasedController,
            readOnly: true,
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2050),
              );
              if (pickedDate != null) {
                _timeReleasedController.text = DateFormat(
                  'dd MMM yyyy',
                ).format(pickedDate);
              }
            },
            decoration: InputDecoration(hintText: 'Input Time Released'),
          ),
        ],
      ),
    );
  }
}
