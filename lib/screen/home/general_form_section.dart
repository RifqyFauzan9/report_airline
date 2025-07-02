import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

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
    final lmcrProvider = context.read<LmcrProvider>();
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
            decoration: InputDecoration(labelText: 'Input Date (UTC)'),
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2050),
              );
              if (pickedDate != null) {
                final formatted = DateFormat('dd MMM yyyy').format(pickedDate);
                _dateUtcController.text = formatted;
                lmcrProvider.updateDateUtc(formatted);
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
            decoration: InputDecoration(labelText: 'Input A/C Type'),
            onChanged: (value) => lmcrProvider.updateAcType(value),
          ),
          const SizedBox(height: 16),
          Text('A/C Reg', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _acRegController,
            decoration: InputDecoration(labelText: 'Input A/C Reg'),
            onChanged: (value) => lmcrProvider.updateAcReg(value),
          ),
          const SizedBox(height: 16),
          Text('OTR', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _otrController,
            decoration: InputDecoration(labelText: 'Input OTR'),
            onChanged: (value) => lmcrProvider.updateOtr(value),
          ),
          const SizedBox(height: 16),
          Text('Released By', style: fieldLabelStyle),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.sentences,
            controller: _releasedByController,
            decoration: InputDecoration(labelText: 'Input Released By'),
            onChanged: (value) => lmcrProvider.updateReleasedBy(value),
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
                final formatted = DateFormat('dd MMM yyyy').format(pickedDate);
                _timeReleasedController.text = formatted;
                lmcrProvider.updateTimeReleased(formatted);
              }
            },

            decoration: InputDecoration(labelText: 'Input Time Released'),
          ),
        ],
      ),
    );
  }
}
