class CarModel {
  final String carName;
  final String kilometers;
  final String oilKilometers;
  final String checkKilometers;
  final String note;
  final String id;

  CarModel({
    required this.id,
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

  factory CarModel.fromJson(
      {required String id, required Map<String, dynamic> json}) {
    return CarModel(
      id: id,
      oilKilometers: json['oil_kilometers'],
      note: json['note'],
      carName: json['car_name'],
      checkKilometers: json['check_kilometers'],
      kilometers: json['kilometers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'car_name': carName,
      'kilometers': kilometers,
      'oil_kilometers': oilKilometers,
      'check_kilometers': checkKilometers,
      'note': note,
    };
  }
}
