import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/enums.dart';
import 'package:mechanic/core/utils/functions.dart';
import 'package:mechanic/data/data_sources/auth_remote_data_source.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/home/home_screen.dart';

class LoginController extends GetxController {
  final BaseAuthRemoteDataSource _remoteDataSource = AuthRemoteDataSource();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loading = false;

  changeLoadingValue() {
    loading = !loading;
    update();
  }

  navigateUserAfterLoginSuccess() {
    Get.offAll(
      () => const HomeScreen(),
      transition: kTransition1,
      duration: kTransitionDuration,
    );
  }

  saveUserInLocal(User user) {
    HiveHelper.hiveSaveUser(
      UserModel(
        name: getNameFromEmail(user.email!),
        email: user.email!,
        token: user.uid,
      ),
    );
  }

  Future login() async {
    changeLoadingValue();
    final result = await _remoteDataSource.login(
      email: emailController.text.trim(),
      pass: passwordController.text,
    );
    if (result.requestState == RequestState.success) {
      if (result.data!.user != null) {
        saveUserInLocal(result.data!.user!);
        navigateUserAfterLoginSuccess();
        changeLoadingValue();
      }
    } else if (result.requestState == RequestState.failed) {
      snackBarError(result.errorMessage!);
      changeLoadingValue();
    }
  }
}
