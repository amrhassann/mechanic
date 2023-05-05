import 'package:hive/hive.dart';

part 'car_status.g.dart';

@HiveType(typeId: 0)
class CarStatus {
  @HiveField(0)
  final int lastKilometers;
  @HiveField(1)
  final int oilKilometers;
  @HiveField(2)
  final int checkKilometers;

  CarStatus({
    required this.lastKilometers,
    required this.oilKilometers,
    required this.checkKilometers,
  });

  CarStatus copyWith({
    int? lastKilometers,
    int? oilKilometers,
    int? checkKilometers,
  }) {
    return CarStatus(
      lastKilometers: lastKilometers ?? this.lastKilometers,
      oilKilometers: checkKilometers ?? this.checkKilometers,
      checkKilometers: checkKilometers ?? this.checkKilometers,
    );
  }
//
//   String getOilKilometers() {
//     if (currentKilometers == null) {
//       return oilKilometers.toString();
//     } else {
//       int done = lastKilometers - currentKilometers!;
//       return '${done - 1000}';
//     }
//   }
//
//   String getCheckKilometers() {
//     if (currentKilometers == null) {
//       return oilKilometers.toString();
//     } else {
//       int done = lastKilometers - currentKilometers!;
//       return '${done - 60000}';
//     }
//   }
// }
}
