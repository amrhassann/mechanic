import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/data/models/car_status.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/auth/view/login_screen.dart';

class HiveHelper {
  ///[hiveInit]
  static hiveInit() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CarStatusAdapter());
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox(kCarStatusHiveBox);
    await Hive.openBox(kUserTokenHiveBox);
  }

  /// [hiveSaveUser]
  static hiveSaveUser(UserModel user) {
    final box = Hive.box(kUserTokenHiveBox);
    box.put(
      kUserTokenHiveBox,
      user,
    );
  }

  /// [hiveGetUserModelFromLocal]
  static UserModel hiveGetUserModelFromLocal() {
    final box = Hive.box(kUserTokenHiveBox);
    final userModel = box.get(kUserTokenHiveBox);
    if (userModel == null) {
      Get.offAll(LoginScreen());
    }
    return userModel;
  }

  /// [getUserToken]
  static String? getUserToken() {
    final box = Hive.box(kUserTokenHiveBox);
    final token = box.get(kUserTokenHiveBox)?.token;
    if (token == null) {
      return null;
    } else {
      return token;
    }
  }

  ///[logoutUser]
  /// delete user from box
  static logoutUser()async{
    final userBox = await Hive.openBox(kUserTokenHiveBox);
    await userBox.delete(kUserTokenHiveBox);
  }

}
