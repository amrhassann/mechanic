class CarModel {
  final String carName;
  final String kilometers;
  final String oilKilometers;
  final String checkKilometers;
  final String note;

  CarModel({
    required this.oilKilometers,
    required this.note,
    required this.carName,
    required this.checkKilometers,
    required this.kilometers,
  });

  @override
  String toString() {
    return 'carName: $carName';
  }

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      oilKilometers: json['oil_kilometers'],
      note: json['note'],
      carName: json['car_name'],
      checkKilometers: json['check_kilometers'],
      kilometers: json['kilometers'],
    );
  }
}
