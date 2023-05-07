import 'package:get/get.dart';
import 'package:mechanic/features/auth/controller/create_account_controller.dart';
import 'package:mechanic/features/auth/controller/login_controller.dart';
import 'package:mechanic/features/car_status/controller/car_status_controller.dart';
import 'package:mechanic/features/cars/controller/get_cars_controller.dart';
import 'package:mechanic/features/cars/controller/refresh_car_controller.dart';
import 'package:mechanic/features/q_and_a/controller/controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    ///[Authentication]
    Get.lazyPut(() => CarStatusController());
    Get.lazyPut(() => CreateAccountController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => QuestionsController());
    Get.lazyPut(() => GetCarsController());
    Get.lazyPut(() => RefreshCarController());
  }
}
