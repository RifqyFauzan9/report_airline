enum FormType {
  sriwijayaServiceCheck('Service Check'),
  sriwijayaPreDeparture('Pre-Departure Check'),
  sriwijayaTransit('Transit Check'),
  namDailyInspection('Daily Inspection Check'),
  namPreFlight('Pre-Flight Check'),
  namTransit('Transit Check');

  final String name;
  const FormType(this.name);
}