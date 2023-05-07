import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/functions.dart';
import 'package:mechanic/data/data_sources/car_data_source.dart';
import 'package:mechanic/data/models/car_model/car_model.dart';
import 'package:mechanic/features/cars/controller/get_cars_controller.dart';

class CreateCarController extends GetxController {
  final BaseCareDataSource _dataSource = CarDataSource();

  final newCarNameController = TextEditingController();
  final newKilometersController = TextEditingController();
  final newOilKilometersController = TextEditingController();
  final newCheckKilometersController = TextEditingController();
  final newNoteController = TextEditingController();

  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  Future<void> createCar() async {
    changeLoadingValue();
    try {
      final car = CarModel(
        carName: newCarNameController.text.trim(),
        kilometers: newKilometersController.text.trim(),
        oilKilometers: newOilKilometersController.text.trim(),
        checkKilometers: newCheckKilometersController.text.trim(),
        note: newNoteController.text.trim(),
        id: DateTime.now().millisecondsSinceEpoch.toString(),
      );

      changeLoadingValue();

      final result = await _dataSource.createCar(car);

      changeLoadingValue();

      if (result.requestState == RequestState.success) {
        Get.back();
        Get.find<GetCarsController>().getCars();
        snackBarSuccess('Car Added successfully');
      } else {
        snackBarError(result.errorMessage ?? 'Error creating car');
      }
    } catch (e) {
      changeLoadingValue();
      snackBarError('Error creating car');
    }
  }

  @override
  void dispose() {
    newCarNameController.dispose();
    newKilometersController.dispose();
    newOilKilometersController.dispose();
    newCheckKilometersController.dispose();
    newNoteController.dispose();
    super.dispose();
  }
}
