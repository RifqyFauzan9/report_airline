import 'package:flutter/material.dart';

import '../static/form_type.dart';

class FormFieldModel {
  final String label;
  final String key;
  final bool isDatePicker;
  final bool isTimePicker;
  final bool isMultiline;
  final bool isNumberInput;
  final TextInputType inputType;
  final bool isDropdown;
  final List<String> dropdownItems;

  FormFieldModel({
    required this.label,
    required this.key,
    this.isDatePicker = false,
    this.isTimePicker = false,
    this.isMultiline = false,
    this.isNumberInput = false,
    this.inputType = TextInputType.text,
    this.isDropdown = false,
    this.dropdownItems = const [],
  });
}

final Map<FormType, List<FormFieldModel>> formSchemas = {
  // Sriwijaya
  FormType.sriwijayaServiceCheck: [
    FormFieldModel(label: 'Date (UTC)', key: 'dateUtc', isDatePicker: true),
    FormFieldModel(
      label: 'A/C Type',
      key: 'acType',
      isDropdown: true,
      dropdownItems: ['B737-500', 'B737-800'],
    ),
    FormFieldModel(label: 'A/C Reg', key: 'acReg'),
    FormFieldModel(label: 'OTR', key: 'otr'),
    FormFieldModel(label: 'Released By', key: 'releasedBy'),
    FormFieldModel(
      label: 'Time Released',
      key: 'timeReleased',
      isTimePicker: true,
    ),
    FormFieldModel(label: 'PIREP', key: 'pirep', isMultiline: true),
    FormFieldModel(label: 'ACTION', key: 'action', isMultiline: true),
    FormFieldModel(label: 'DMI', key: 'dmi', isMultiline: true),

    FormFieldModel(label: 'ENG OIL (00/00)', key: 'engOil'),
    FormFieldModel(label: 'IDG OIL (00/00)', key: 'idgOil'),
    FormFieldModel(label: 'APU OIL (00)', key: 'apuOil', isNumberInput: true),
    FormFieldModel(label: 'HYD FLUID (00/00)', key: 'hydFluid'),

    FormFieldModel(label: 'OXYGEN (PSI)', key: 'oxygen', isNumberInput: true),

    FormFieldModel(label: 'Brake Pin 1 (mm)', key: 'pin1', isNumberInput: true),
    FormFieldModel(label: 'Brake Pin 2 (mm)', key: 'pin2', isNumberInput: true),
    FormFieldModel(label: 'Brake Pin 3 (mm)', key: 'pin3', isNumberInput: true),
    FormFieldModel(label: 'Brake Pin 4 (mm)', key: 'pin4', isNumberInput: true),

    FormFieldModel(label: 'Main Wheel 1 (0%/0 PSI)', key: 'main1'),
    FormFieldModel(label: 'Main Wheel 2 (0%/0 PSI)', key: 'main2'),
    FormFieldModel(label: 'Main Wheel 3 (0%/0 PSI)', key: 'main3'),
    FormFieldModel(label: 'Main Wheel 4 (0%/0 PSI)', key: 'main4'),

    FormFieldModel(label: 'Nose Wheel LH (0%/0 PSI)', key: 'noseLh'),
    FormFieldModel(label: 'Nose Wheel RH (0%/0 PSI)', key: 'noseRh'),
    FormFieldModel(
      label: 'APU Status',
      key: 'apuStatus',
      isDropdown: true,
      dropdownItems: ['SERVICEABLE', 'UNSERVICEABLE'],
    ),

    FormFieldModel(label: 'F.A.K', key: 'fak', isMultiline: true),

    FormFieldModel(
      label: 'Station',
      key: 'station',
      isDropdown: true,
      dropdownItems: ['LM DEPATI AMIR', 'LM NAM-JKT', 'LM NAM-E UPG'],
    ),
  ],
  FormType.sriwijayaPreDeparture: [
    FormFieldModel(label: 'Date (UTC)', key: 'dateUtc', isDatePicker: true),
    FormFieldModel(
      label: 'A/C Type',
      key: 'acType',
      isDropdown: true,
      dropdownItems: ['B737-500', 'B737-800'],
    ),
    FormFieldModel(label: 'A/C Reg', key: 'acReg'),
    FormFieldModel(label: 'OTR', key: 'otr'),
    FormFieldModel(label: 'Released By', key: 'releasedBy'),
    FormFieldModel(
      label: 'Time Released',
      key: 'timeReleased',
      isTimePicker: true,
    ),
    FormFieldModel(label: 'PIREP', key: 'pirep', isMultiline: true),
    FormFieldModel(label: 'ACTION', key: 'action', isMultiline: true),
    FormFieldModel(label: 'DMI', key: 'dmi'),
  ],
  FormType.sriwijayaTransit: [
    FormFieldModel(label: 'Date (UTC)', key: 'dateUtc', isDatePicker: true),
    FormFieldModel(
      label: 'A/C Type',
      key: 'acType',
      isDropdown: true,
      dropdownItems: ['B737-500', 'B737-800'],
    ),
    FormFieldModel(label: 'A/C Reg', key: 'acReg'),
    FormFieldModel(label: 'Flight Number', key: 'flightNumber'),
    FormFieldModel(label: 'Route', key: 'route'),
    FormFieldModel(label: 'ETD', key: 'etd', isTimePicker: true),
    FormFieldModel(label: 'ATD', key: 'atd', isTimePicker: true),
    FormFieldModel(label: 'PIC', key: 'pic'),
    FormFieldModel(label: 'EOB', key: 'eob'),
    FormFieldModel(label: 'DMI', key: 'dmi', isMultiline: true),
    FormFieldModel(label: 'Remarks', key: 'remarks', isMultiline: true),
    FormFieldModel(
      label: 'APU Status',
      key: 'apuStatus',
      isDropdown: true,
      dropdownItems: ['SERVICEABLE', 'UNSERVICEABLE'],
    ),
    FormFieldModel(
      label: 'Station',
      key: 'station',
      isDropdown: true,
      dropdownItems: ['LM DEPATI AMIR', 'LM NAM-JKT', 'LM NAM-E UPG'],
    ),
  ],

  // Nam Form Part
  FormType.namDailyInspection: [
    FormFieldModel(label: 'Date (UTC)', key: 'dateUtc', isDatePicker: true),
    FormFieldModel(
      label: 'A/C Type',
      key: 'acType',
      isDropdown: true,
      dropdownItems: ['B737-500', 'B737-800'],
    ),
    FormFieldModel(label: 'A/C Reg', key: 'acReg'),
    FormFieldModel(label: 'OTR', key: 'otr'),
    FormFieldModel(label: 'Released By', key: 'releasedBy'),
    FormFieldModel(
      label: 'Time Released',
      key: 'timeReleased',
      isTimePicker: true,
    ),
    FormFieldModel(label: 'PIREP', key: 'pirep', isMultiline: true),
    FormFieldModel(label: 'ACTION', key: 'action', isMultiline: true),
    FormFieldModel(label: 'DMI', key: 'dmi', isMultiline: true),

    FormFieldModel(label: 'ENG OIL (00/00)', key: 'engOil'),
    FormFieldModel(label: 'IDG OIL (00/00)', key: 'idgOil'),
    FormFieldModel(label: 'APU OIL (00)', key: 'apuOil', isNumberInput: true),
    FormFieldModel(label: 'HYD FLUID (00/00)', key: 'hydFluid'),

    FormFieldModel(label: 'OXYGEN (PSI)', key: 'oxygen', isNumberInput: true),

    FormFieldModel(label: 'Brake Pin 1 (mm)', key: 'pin1', isNumberInput: true),
    FormFieldModel(label: 'Brake Pin 2 (mm)', key: 'pin2', isNumberInput: true),
    FormFieldModel(label: 'Brake Pin 3 (mm)', key: 'pin3', isNumberInput: true),
    FormFieldModel(label: 'Brake Pin 4 (mm)', key: 'pin4', isNumberInput: true),

    FormFieldModel(label: 'Main Wheel 1 (0%/0 PSI)', key: 'main1'),
    FormFieldModel(label: 'Main Wheel 2 (0%/0 PSI)', key: 'main2'),
    FormFieldModel(label: 'Main Wheel 3 (0%/0 PSI)', key: 'main3'),
    FormFieldModel(label: 'Main Wheel 4 (0%/0 PSI)', key: 'main4'),

    FormFieldModel(label: 'Nose Wheel LH (0%/0 PSI)', key: 'noseLh'),
    FormFieldModel(label: 'Nose Wheel RH (0%/0 PSI)', key: 'noseRh'),
    FormFieldModel(
      label: 'APU Status',
      key: 'apuStatus',
      isDropdown: true,
      dropdownItems: ['SERVICEABLE', 'UNSERVICEABLE'],
    ),

    FormFieldModel(label: 'F.A.K', key: 'fak', isMultiline: true),

    FormFieldModel(
      label: 'Station',
      key: 'station',
      isDropdown: true,
      dropdownItems: ['LM DEPATI AMIR', 'LM NAM-JKT', 'LM NAM-E UPG'],
    ),
  ],
  FormType.namPreFlight: [
    FormFieldModel(label: 'Date (UTC)', key: 'dateUtc', isDatePicker: true),
    FormFieldModel(label: 'A/C Type', key: 'acType'),
    FormFieldModel(label: 'A/C Reg', key: 'acReg'),
    FormFieldModel(label: 'OTR', key: 'otr'),
    FormFieldModel(label: 'Released By', key: 'releasedBy'),
    FormFieldModel(
      label: 'Time Released',
      key: 'timeReleased',
      isTimePicker: true,
    ),
    FormFieldModel(label: 'PIREP', key: 'pirep', isMultiline: true),
    FormFieldModel(label: 'ACTION', key: 'action', isMultiline: true),
    FormFieldModel(label: 'DMI', key: 'dmi'),
  ],
  FormType.namTransit: [
    FormFieldModel(label: 'Date (UTC)', key: 'dateUtc', isDatePicker: true),
    FormFieldModel(
      label: 'A/C Type',
      key: 'acType',
      isDropdown: true,
      dropdownItems: ['B737-500', 'B737-800'],
    ),
    FormFieldModel(label: 'A/C Reg', key: 'acReg'),
    FormFieldModel(label: 'Flight Number', key: 'flightNumber'),
    FormFieldModel(label: 'Route', key: 'route'),
    FormFieldModel(label: 'ETD', key: 'etd', isTimePicker: true),
    FormFieldModel(label: 'ATD', key: 'atd', isTimePicker: true),
    FormFieldModel(label: 'PIC', key: 'pic'),
    FormFieldModel(label: 'EOB', key: 'eob'),
    FormFieldModel(label: 'DMI', key: 'dmi', isMultiline: true),
    FormFieldModel(label: 'Remarks', key: 'remarks', isMultiline: true),
    FormFieldModel(
      label: 'APU Status',
      key: 'apuStatus',
      isDropdown: true,
      dropdownItems: ['SERVICEABLE', 'UNSERVICEABLE'],
    ),
    FormFieldModel(
      label: 'Station',
      key: 'station',
      isDropdown: true,
      dropdownItems: ['LM DEPATI AMIR', 'LM NAM-JKT', 'LM NAM-E UPG'],
    ),
  ],
};
