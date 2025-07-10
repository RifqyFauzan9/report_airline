class LmcrReport {
  DateTime? dateUtc;
  String? acType;
  String? acReg;
  String? otr;
  String? releasedBy;
  DateTime? timeReleased;
  String? pirep;
  String? action;
  String? dmi;
  int? engOilBefore;
  int? engOilAfter;
  int? idgOilBefore;
  int? idgOilAfter;
  int? apuOil;
  int? hydFluidBefore;
  int? hydFluidAfter;
  double? oxygen;
  List<double>? brakePins;
  Map<String, int>? wheelCondition;
  String? apuStatus;
  List<int>? fak;
  String? performedServiceCode;
  String? signedByOrUnit;

  Map<String, dynamic> toJson() {
    return {
      'dateUtc': dateUtc?.toIso8601String(),
      'acType': acType,
      'acReg': acReg,
      'otr': otr,
      'releasedBy': releasedBy,
      'timeReleased': timeReleased,
      'pirep': pirep,
      'action': action,
      'dmi': dmi,
      'engOilBefore': engOilBefore,
      'engOilAfter': engOilAfter,
      'idgOilBefore': idgOilBefore,
      'idgOilAfter': idgOilAfter,
      'apuOil': apuOil,
      'hydFluidBefore': hydFluidBefore,
      'hydFluidAfter': hydFluidAfter,
      'oxygen': oxygen,
      'brakePins': brakePins,
      'wheelCondition': wheelCondition,
      'apuStatus': apuStatus,
      'fak': fak,
      'performedServiceCode': performedServiceCode,
      'signedByOrUnit': signedByOrUnit,
    };
  }

  @override
  String toString() {
    return 'dateUtc: $dateUtc\n'
        'acType: $acType\n'
        'acReg: $acReg\n'
        'otr: $otr\n'
        'releasedBy: $releasedBy\n'
        'timeReleased: $timeReleased\n'
        'pirep: $pirep\n'
        'action: $action\n'
        'dmi: $dmi\n'
        'engOilBefore: $engOilBefore\n'
        'engOilAfter: $engOilAfter\n'
        'idgOilBefore: $idgOilBefore\n'
        'idgOilAfter: $idgOilAfter\n'
        'apuOil: $apuOil\n'
        'hydFluidBefore: $hydFluidBefore\n'
        'hydFluidAfter: $hydFluidAfter\n'
        'oxygen PSI: $oxygen\n'
        'brakePins: $brakePins\n'
        'wheelCondition: $wheelCondition\n'
        'apuStatus: $apuStatus\n'
        'apuFak: $fak\n'
        'performedServiceCode: $performedServiceCode\n'
        'Signed By: $signedByOrUnit';
  }
}
