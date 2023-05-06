import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/features/auth/controller/login_controller.dart';
import 'package:mechanic/features/auth/view/create_account.dart';
import 'package:mechanic/widgets/default_button.dart';
import 'package:mechanic/widgets/loading/button_loading.dart';
import 'package:mechanic/widgets/text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تسجيل الدخول',
          style: TextStyle(color: ColorsManager.primary, fontSize: 16),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: FadeIn(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: controller.emailController,
                      label: 'البريد الالكتروني',
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: controller.passwordController,
                      label: 'كلمة المرور',
                      isPassword: true,
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GetBuilder<LoginController>(
                      builder: (cc) {
                        if (cc.loading) {
                          return const ButtonLoading();
                        } else {
                          return DefaultButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.login();
                              }
                            },
                            text: 'تسجيل الدخول',
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(
                          () => CreateAccountScreen(),
                          transition: kTransition1,
                          duration: kTransitionDuration,
                        );
                      },
                      child: const Text('إنشاء حساب جديد',style: TextStyle(color: ColorsManager.primary),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
