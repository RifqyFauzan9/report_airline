class LmcrReport {
  String? dateUtc;
  String? timeReleased;
  String? releasedBy;
  String? acType;
  String? acReg;
  String? captain;
  String? otr;
  String? pirep;
  String? dmi;
  String? engOil;
  String? idgOil;
  String? apuOil;
  String? hydFluid;
  String? oxygen;
  List<String>? brakePins;
  Map<String, String>? wheelCondition;
  Map<String, String>? tirePressure;
  String? apuStatus;
  String? fak;

  Map<String, dynamic> toMap() {
    return {
      'dateUtc': dateUtc,
      'acType': acType,
      'acReg': acReg,
      'captain': captain,
      'otr': otr,
      'pirep': pirep,
      'dmi': dmi,
      'engOil': engOil,
      'idgOil': idgOil,
      'apuOil': apuOil,
      'hydFluid': hydFluid,
      'oxygen': oxygen,
      'brakePins': brakePins,
      'wheelCondition': wheelCondition,
      'tirePressure': tirePressure,
      'apuStatus': apuStatus,
      'fak': fak,
      'releasedBy': releasedBy,
      'timeReleased': timeReleased,
    };
  }

  @override
  String toString() {
    return 'dateUtc: $dateUtc\nacType: $acType\nacReg: $acReg\notr: $otr\nreleasedBy: $releasedBy\ntimeReleased: $timeReleased\npirep: $pirep\ndmi: $dmi\nengOil: $engOil\nidgOil: $idgOil\ncaptain: $captain\napuOil: $apuOil\nhydFluid: $hydFluid\noxygen: $oxygen\nbrakePins: $brakePins\nwheelCondition: $wheelCondition\ntirePressure: $tirePressure\napuStatus: $apuStatus\nfak: $fak';
  }
}
