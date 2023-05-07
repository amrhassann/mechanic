
import 'package:flutter/material.dart' show Colors,Color,TextStyle;
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';

snackBarError(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.errorBG,
    colorText: ColorsManager.errorText,
  );
}
snackBarSuccess(String error) {
  Get.snackbar(
    '',
    error,
    backgroundColor: ColorsManager.white,
    colorText: ColorsManager.primary,
  );
}

getNameFromEmail(String email) {
  return email.split('@').first;
}

bool isPositive(String value) {
  final num = int.parse(value);
  return num > 0;
}

TextStyle getStyleBasedOnValue(String value) {
  Color textColor = isPositive(value) ? Colors.black : Colors.red;
  return TextStyle(color: textColor, fontSize: 16);
}