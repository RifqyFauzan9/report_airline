import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../static/form_type.dart';

String generateWhatsappMessage({
  required FormType formType,
  required Map<String, String> data,
}) {
  switch (formType) {
    case FormType.namTransit:
    case FormType.sriwijayaTransit:
      return _generateTransitMessage(data, formType);
    case FormType.namDailyInspection:
    case FormType.sriwijayaServiceCheck:
      return _generateServiceCheckMessage(data, formType);
    default:
      return "Laporan belum didukung untuk dikirim ke WhatsApp.";
  }
}

String _generateTransitMessage(Map<String, String> data, FormType formType) {
  return '''
*_LMCR ${_formTypeName(formType)} PERFORMED_*
```
DATE : ${data['dateUtc'] ?? ''}
A/C TYPE : ${data['acType'] ?? ''}
A/C REG : ${data['acReg'] ?? ''}
FLT NO : ${data['flightNumber'] ?? ''}
ROUTE : ${data['route'] ?? ''}
ETD : ${data['etd'] ?? ''} UTC
ATD : ${data['atd'] ?? ''} UTC
PIC : ${data['pic'] ?? ''}
EOB : ${data['eob'] ?? ''}
DMI : ${data['dmi']?.isNotEmpty == true ? data['dmi'] : 'NIL'}

REMARKS : ${data['remarks'] ?? ''}
```
APU STATUS ${data['apuStatus']?.toUpperCase() ?? 'UNKNOWN'}

REGARDS,
*_${data['station'] ?? 'LM STATION'}_*
''';
}

String _generateServiceCheckMessage(
  Map<String, String> data,
  FormType formType,
) {
  return '''
*LMCR ${_formTypeName(formType)} PERFORMED*
```
DATE UTC  : ${data['dateUtc']}
A/C TYPE  : ${data['acType']}
A/C REG   : ${data['acReg']}

REL BY    : ${data['releasedBy']}
TIME REL  : ${data['timeReleased']} UTC
OTR       : ${data['otr']}

PIREP     : ${data['pirep']}
ACTION    : ${data['action']}
DMI       : ${data['dmi']}

ENG OIL   : ${data['engOil']}
IDG OIL   : ${data['idgOil']}
APU OIL   : ${data['apuOil']}
HYD FLUID : ${data['hydFluid']}

OXYGEN    : ${data['oxygen']}

WEAR BRAKE PIN 
1. ${data['pin1']} MM
2. ${data['pin2']} MM
3. ${data['pin3']} MM  
4. ${data['pin4']} MM

WHEEL COND & TIRE PRESSURE 

MAIN WHEEL :
1. ${data['main1']}
2. ${data['main2']}
3. ${data['main3']}
4. ${data['main4']}

NOSE WHEEL 
LH. ${data['noseLh']}
RH. ${data['noseRh']}

APU STATUS ${data['apuStatus']?.toUpperCase() ?? 'UNKNOWN'}

F.A.K   : ${data['fak']}

PERFORMED SERVICE CHECK 
REF FORM TE-028 REV.10
```
_Best Regards_
*${data['station'] ?? 'LM STATION'}*
''';
}

String _formTypeName(FormType formType) {
  return formType.name
      .replaceAll('nam', 'NAM')
      .replaceAll('sriwijaya', 'SRIWIJAYA')
      .replaceAll(RegExp(r'([a-z])([A-Z])'), r'$1 $2')
      .toUpperCase();
}

Future<void> sendWhatsappMessage(BuildContext context, String message) async {
  final encodedMessage = Uri.encodeComponent(message);
  final url = Uri.parse("https://wa.me/?text=$encodedMessage");
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Could not open WhatsApp')));
  }
}
