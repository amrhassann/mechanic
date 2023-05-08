import 'package:get/get.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/functions.dart';
import 'package:mechanic/data/data_sources/car_data_source.dart';
import 'package:mechanic/data/models/car_model/car_model.dart';

class RefreshCarController extends GetxController {
  final BaseCareDataSource _source = CarDataSource();
  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  CarModel newModel(CarModel car, String newValue) {
    final int newKilometers = int.parse(newValue);
    CarModel newCarModel = CarModel(
      id: car.id,
      oilKilometers: getOilKilometers(car, newKilometers).toString(),
      note: car.note,
      carName: car.carName,
      checkKilometers: getCheckKilometers(car, newKilometers).toString(),
      kilometers: newKilometers.toString(),
    );
    return newCarModel;
  }

  int getOilKilometers(CarModel car, int newKilometers) {
    final int done =   newKilometers-int.parse(car.kilometers);
    return int.parse(car.oilKilometers) - done;
  }

  int getCheckKilometers(CarModel car, int newKilometers) {
    final int done =   newKilometers-int.parse(car.kilometers);
    return int.parse(car.checkKilometers) - done;
  }

  Future refreshCar(CarModel car, String newValue)async {
    changeLoadingValue();
    await _source.updateCar(newModel(car, newValue)).then(
          (result) {
            if(result.requestState == RequestState.success){
              changeLoadingValue();
            }else{
              changeLoadingValue();
              snackBarError(result.errorMessage??"Error");
            }
          },
        );
  }
}
