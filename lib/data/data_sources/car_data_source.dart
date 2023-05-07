import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/networking/request_result.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/data/models/car_model/car_model.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';

abstract class BaseCareDataSource {
  Future<RequestResult<List<CarModel>>> getUserCars();
  Future<RequestResult<void>> updateCar(CarModel car);
}

class CarDataSource implements BaseCareDataSource {
  UserModel user() => HiveHelper.hiveGetUserModelFromLocal();

  @override
  Future<RequestResult<List<CarModel>>> getUserCars() async {
    try {
      final email = user().email;
      final carsSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .collection('cars')
          .get();

      final cars = carsSnapshot.docs
          .map((doc) => CarModel.fromJson(id: doc.id,json: doc.data()))
          .toList();

      log('cars retrieved successfully : ${cars.map((e) => e.toString())}');
      if (cars.isEmpty) {
        return RequestResult(
          requestState: RequestState.failed,
          errorMessage: 'No cars found for user',
        );
      }

      return RequestResult(
        requestState: RequestState.success,
        data: cars,
      );
    } catch (e) {
      log('Error retrieving cars: $e');
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.toString(),
      );
    }
  }

  @override
  Future<RequestResult<void>> updateCar(CarModel car) async {
    try {
      final email = user().email;
      final carRef = FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .collection('cars')
          .doc(car.id);
      await carRef.update(car.toJson());

      return RequestResult(
        requestState: RequestState.success,
      );
    } catch (e) {
      log('Error updating car: $e');
      return RequestResult(
        requestState: RequestState.failed,
        errorMessage: e.toString(),
      );
    }
  }

}
