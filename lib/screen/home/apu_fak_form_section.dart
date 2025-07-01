import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  String selectedItem = 'Serviceable';

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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('APU Status', style: fieldLabelStyle),
          const SizedBox(height: 8),
          DropdownButtonFormField(
            icon: Icon(CupertinoIcons.chevron_down),
            value: selectedItem,
            items: ['Serviceable', 'Unserviceable'].map((serv) {
              return DropdownMenuItem(value: serv, child: Text(serv));
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedItem = value!;
              });
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
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(hintText: 'F.A.K M/W (EA)'),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  controller: _fakNwController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(hintText: 'F.A.K N/W (EA)'),
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