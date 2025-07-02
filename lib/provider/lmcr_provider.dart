import 'package:flutter/material.dart';

import '../model/lmcr_report.dart';

class LmcrProvider with ChangeNotifier {
  final LmcrReport _report = LmcrReport();

  LmcrReport get report => _report;

  // =================== UPDATE FIELDS ===================

  void updateDateUtc(String value) {
    _report.dateUtc = value;
    notifyListeners();
  }

  void updateReleasedBy(String value) {
    _report.releasedBy = value;
    notifyListeners();
  }

  void updateTimeReleased(String value) {
    _report.timeReleased = value;
    notifyListeners();
  }

  void updateAcType(String value) {
    _report.acType = value;
    notifyListeners();
  }

  void updateAcReg(String value) {
    _report.acReg = value;
    notifyListeners();
  }

  void updateCaptain(String value) {
    _report.captain = value;
    notifyListeners();
  }

  void updateOtr(String value) {
    _report.otr = value;
    notifyListeners();
  }

  void updatePirep(String value) {
    _report.pirep = value;
    notifyListeners();
  }

  void updateDmi(String value) {
    _report.dmi = value;
    notifyListeners();
  }

  void updateEngOil(String value) {
    _report.engOil = value;
    notifyListeners();
  }

  void updateIdgOil(String value) {
    _report.idgOil = value;
    notifyListeners();
  }

  void updateApuOil(String value) {
    _report.apuOil = value;
    notifyListeners();
  }

  void updateHydFluid(String value) {
    _report.hydFluid = value;
    notifyListeners();
  }

  void updateOxygen(String value) {
    _report.oxygen = value;
    notifyListeners();
  }

  void updateBrakePins(List<String> pins) {
    _report.brakePins = pins;
    notifyListeners();
  }

  void updateWheelCondition(Map<String, String> condition) {
    _report.wheelCondition = condition;
    notifyListeners();
  }

  void updateTirePressure(Map<String, String> pressure) {
    _report.tirePressure = pressure;
    notifyListeners();
  }

  void updateApuStatus(String value) {
    _report.apuStatus = value;
    notifyListeners();
  }

  void updateFak(String value) {
    _report.fak = value;
    notifyListeners();
  }

  // =================== RESET ===================

  void reset() {
    _report
      ..dateUtc = null
      ..acType = null
      ..acReg = null
      ..captain = null
      ..otr = null
      ..pirep = null
      ..dmi = null
      ..engOil = null
      ..idgOil = null
      ..apuOil = null
      ..hydFluid = null
      ..oxygen = null
      ..brakePins = []
      ..wheelCondition = {}
      ..tirePressure = {}
      ..apuStatus = null
      ..fak = null;

    notifyListeners();
  }
}
