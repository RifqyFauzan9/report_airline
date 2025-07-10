import 'package:flutter/material.dart';

import '../model/lmcr_report.dart';

class LmcrProvider with ChangeNotifier {
  final LmcrReport _report = LmcrReport(

  );

  LmcrReport get report => _report;

  // =================== UPDATE FIELDS ===================

  void updateDateUtc(DateTime value) {
    _report.dateUtc = value;
    notifyListeners();
  }

  void updateReleasedBy(String value) {
    _report.releasedBy = value;
    notifyListeners();
  }

  void updateTimeReleased(DateTime value) {
    _report.timeReleased = value;
    notifyListeners();
  }

  void updateAction(String value) {
    _report.action = value;
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

  void updateEngOilBefore(int value) {
    _report.engOilBefore = value;
    notifyListeners();
  }

  void updateEngOilAfter(int value) {
    _report.engOilAfter = value;
    notifyListeners();
  }

  void updateIdgOilBefore(int value) {
    _report.idgOilBefore = value;
    notifyListeners();
  }

  void updateIdgOilAfter(int value) {
    _report.idgOilAfter = value;
    notifyListeners();
  }

  void updateApuOil(int value) {
    _report.apuOil = value;
    notifyListeners();
  }

  void updateHydFluidBefore(int value) {
    _report.hydFluidBefore = value;
    notifyListeners();
  }

  void updateHydFluidAfter(int value) {
    _report.hydFluidAfter = value;
    notifyListeners();
  }

  void updateOxygen(double value) {
    _report.oxygen = value;
    notifyListeners();
  }

  // Brake Pins
  double _pin1 = 0.0;
  double _pin2 = 0.0;
  double _pin3 = 0.0;
  double _pin4 = 0.0;

  void updatePin1(double val) {
    _pin1 = val;
    _updateBrakePins();
  }

  void updatePin2(double val) {
    _pin2 = val;
    _updateBrakePins();
  }

  void updatePin3(double val) {
    _pin3 = val;
    _updateBrakePins();
  }

  void updatePin4(double val) {
    _pin4 = val;
    _updateBrakePins();
  }

  void _updateBrakePins() {
    _report.brakePins = [_pin1, _pin2, _pin3, _pin4];
    notifyListeners();
  }


  void updateWheelCondition(Map<String, int> condition) {
    _report.wheelCondition = condition;
    notifyListeners();
  }

  void updateApuStatus(String value) {
    _report.apuStatus = value;
    notifyListeners();
  }

  // APU F.A.K
  int _fakMw  = 0;
  int _fakNw  = 0;

  void updateFakMw(int value) {
    _fakMw = value;
    _updateApuFak();
  }

  void updateFakNw(int value) {
    _fakNw = value;
    _updateApuFak();
  }

  void _updateApuFak() {
    _report.fak = [_fakMw, _fakNw];
    notifyListeners();
  }

  void updatePerformedServiceCode(String value) {
    _report.performedServiceCode = value;
    notifyListeners();
  }

  void updateSignedByOrUnit(String value) {
    _report.signedByOrUnit = value;
    notifyListeners();
  }

  // =================== RESET ===================

  void reset() {
    _report
      ..dateUtc = null
      ..acType = null
      ..acReg = null
      ..otr = null
      ..pirep = null
      ..dmi = null
      ..engOilBefore = null
      ..engOilAfter = null
      ..idgOilBefore = null
      ..idgOilAfter = null
      ..apuOil = null
      ..hydFluidBefore = null
      ..hydFluidAfter = null
      ..oxygen = null
      ..brakePins = []
      ..wheelCondition = {}
      ..apuStatus = null
      ..fak = null;

    notifyListeners();
  }
}
