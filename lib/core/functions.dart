import 'package:get/get.dart';
import 'package:mechanic/core/colors_manager.dart';

snackBarError(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.errorBG,
    colorText: ColorsManager.errorText,
  );
}

getNameFromEmail(String email) {
  return email.split('@').first;
}
