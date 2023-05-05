import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/features/auth/controller/create_account_controller.dart';
import 'package:mechanic/widgets/default_button.dart';
import 'package:mechanic/widgets/loading/button_loading.dart';
import 'package:mechanic/widgets/text_field.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CreateAccountController controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'انشاء حساب جديد',
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: CustomTextFormField(
                    //         controller: controller.firstNameController,
                    //         label: 'الاسم الاول',
                    //         requiredField: true,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 5),
                    //     Expanded(
                    //       child: CustomTextFormField(
                    //         controller: controller.lastNameController,
                    //         label: 'اسم العائله',
                    //         requiredField: true,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
                    GetBuilder<CreateAccountController>(builder: (cc) {
                      if (cc.loading) {
                        return const ButtonLoading();
                      } else {
                        return DefaultButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              controller.signUp().then((value) {});
                            }
                          },
                          text: 'إنشاء حساب',
                        );
                      }
                    }),
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
