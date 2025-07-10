import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:report_airline/service/whatsapp_service.dart';
import 'package:report_airline/static/colors.dart';

import '../../model/form_model.dart';
import '../../static/form_type.dart';

class DynamicFormScreen extends StatefulWidget {
  final FormType formType;
  const DynamicFormScreen({super.key, required this.formType});

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> _controllers = {};
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final schema = formSchemas[widget.formType]!;
    for (var field in schema) {
      _controllers[field.key] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var ctrl in _controllers.values) {
      ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final schema = formSchemas[widget.formType]!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.formType.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: _isLoading
          ? Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: AppColor.primary.color,
                size: 64,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      for (var field in schema) _buildField(field),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: _handleSubmit,
                        child: const Text('Submit'),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _buildField(FormFieldModel field) {
    final controller = _controllers[field.key]!;

    Widget input;

    if (field.isDatePicker) {
      input = _buildDateField(field, controller);
    } else if (field.isTimePicker) {
      input = _buildTimeField(field, controller);
    } else if (field.isDropdown) {
      return _buildDropdownField(field, controller);
    } else {
      input = TextFormField(
        textInputAction: field.isMultiline
            ? TextInputAction.newline
            : TextInputAction.next,
        controller: controller,
        keyboardType: field.isMultiline
            ? TextInputType.multiline
            : field.isNumberInput
            ? TextInputType.number
            : field.inputType,
        textCapitalization: TextCapitalization.sentences,
        minLines: field.isMultiline ? 2 : null,
        maxLines: field.isMultiline ? 3 : 1,
        decoration: InputDecoration(
          labelText: field.label,
          border: OutlineInputBorder(),
        ), // Optional
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.label,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          input,
        ],
      ),
    );
  }

  Widget _buildDropdownField(
    FormFieldModel field,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.label,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField<String>(
            value: controller.text.isNotEmpty ? controller.text : null,
            icon: Icon(Icons.keyboard_arrow_down),
            decoration: InputDecoration(
              labelText: field.label,
              border: OutlineInputBorder(),
            ),
            items: field.dropdownItems.map((item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                controller.text = value;
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(
    FormFieldModel field,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(labelText: field.label),
        onTap: () async {
          final picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2100),
          );
          if (picked != null) {
            controller.text = DateFormat('dd MMM yyyy').format(picked);
          }
        },
      ),
    );
  }

  Widget _buildTimeField(
    FormFieldModel field,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(labelText: field.label),
        onTap: () async {
          final picked = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (picked != null) {
            final now = DateTime.now();
            final full = DateTime(
              now.year,
              now.month,
              now.day,
              picked.hour,
              picked.minute,
            );
            controller.text = DateFormat('HH:mm').format(full);
          }
        },
      ),
    );
  }

  void _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(Duration(seconds: 2));

      final submittedData = {
        for (var entry in _controllers.entries)
          entry.key: entry.value.text.trim(),
      };
      final message = generateWhatsappMessage(
        formType: widget.formType,
        data: submittedData,
      );

      debugPrint('Data submitted: $submittedData');

      setState(() => _isLoading = false);

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form submitted!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                sendWhatsappMessage(context, message);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
