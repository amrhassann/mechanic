import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/data/models/car_status.dart';

class CarStatusController extends GetxController {
  final TextEditingController currentKiloMetersController =
      TextEditingController();
  final TextEditingController lastKilometersController =
      TextEditingController();
  final TextEditingController oilKilometersController = TextEditingController();
  final TextEditingController checkKilometersController =
      TextEditingController();

  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  RequestState requestState = RequestState.idle;

  var box = Hive.box(kCarStatusHiveBox);

  CarStatus? savedData;
  late String check;
  late String oil;

  getCurrentData() {
    savedData = box.get(kCarStatusHiveBox);
    if (savedData != null) {
      currentKiloMetersController.text = savedData!.lastKilometers.toString();
      check = getCheckKilometers();
      oil = getOilKilometers();
    }

    return savedData;
  }

  String getCheckKilometers() {
    final done =
        savedData!.lastKilometers - int.parse(checkKilometersController.text);
    return '${60000 - done}';
  }

  String getOilKilometers() {
    final done =
        savedData!.lastKilometers - int.parse(checkKilometersController.text);
    return '${10000 - done}';
  }

  updateKilometers() {
    getCurrentData();
    changeLoadingValue();
    box.put(
      kCarStatusHiveBox,
      savedData!.copyWith(
        lastKilometers: int.parse(currentKiloMetersController.text),
      ),
    );
    changeLoadingValue();
  }

  createNewData() {
    changeLoadingValue();
    box.put(
      kCarStatusHiveBox,
      CarStatus(
        lastKilometers: int.parse(lastKilometersController.text),
        oilKilometers: int.parse(oilKilometersController.text),
        checkKilometers: int.parse(checkKilometersController.text),
      ),
    );
    Future.delayed(Duration(microseconds: 500), () {
      getCurrentData();
    });

    changeLoadingValue();
  }

  @override
  void onInit() {
    getCurrentData();
    super.onInit();
  }
}
