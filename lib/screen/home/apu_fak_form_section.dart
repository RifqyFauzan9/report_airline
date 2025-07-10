import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:report_airline/provider/lmcr_provider.dart';

class ApuFakFormSection extends StatefulWidget {
  const ApuFakFormSection({super.key});

  @override
  State<ApuFakFormSection> createState() => _ApuFakFormSectionState();
}

class _ApuFakFormSectionState extends State<ApuFakFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _fakNwController = TextEditingController();
  final _fakMwController = TextEditingController();

  final List<String> items = ['Serviceable', 'Unserviceable'];

  @override
  void dispose() {
    super.dispose();
    _fakNwController.dispose();
    _fakMwController.dispose();
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
          Text('APU Status', style: fieldLabelStyle),
          const SizedBox(height: 8),
          DropdownButtonFormField(
            icon: Icon(CupertinoIcons.chevron_down),
            decoration: InputDecoration(
              labelText: 'Serviceable / Unserviceable',
            ),
            items: ['Serviceable', 'Unserviceable'].map((serv) {
              return DropdownMenuItem(value: serv, child: Text(serv));
            }).toList(),
            onChanged: (value) {
              provider.updateApuStatus(value!);
            },
          ),
          const SizedBox(height: 16),
          Text('F.A.K', style: fieldLabelStyle),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _fakMwController,
                  decoration: InputDecoration(labelText: 'F.A.K M/W (EA)'),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onChanged: (value) => provider.updateFakMw(int.tryParse(value) ?? 0),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _fakNwController,
                  decoration: InputDecoration(labelText: 'F.A.K N/W (EA)'),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => provider.updateFakNw(int.tryParse(value) ?? 0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
