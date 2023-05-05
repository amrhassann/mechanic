import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/features/car_status/controller/car_status_controller.dart';
import 'package:mechanic/features/car_status/view/first_time_form_screen.dart';
import 'package:mechanic/widgets/default_button.dart';
import 'package:mechanic/widgets/text_field.dart';

class GetCurrentKilometersScreen extends StatelessWidget {
  GetCurrentKilometersScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controller = Get.put(CarStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: const TextSpan(
                    text: 'مرحبا بك',
                    style: TextStyle(color: ColorsManager.black, fontSize: 16),
                    children: [
                      TextSpan(
                          text: ' المساعد الفني',
                          style: TextStyle(
                              color: ColorsManager.primary, fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                controller: controller.currentKiloMetersController,
                label: 'عدد الكيلومترات الحاليه',
                requiredField: true,
              ),
              const SizedBox(
                height: 25,
              ),
              DefaultButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   controller.updateKilometers();
                  //   Future.delayed(
                  //     const Duration(seconds: 2),
                  //     () {
                  //       Get.off(
                  //         () => const HomeScreen(),
                  //         transition: kTransition1,
                  //         duration: kTransitionDuration,
                  //       );
                  //     },
                  //   );
                  // }
                },
                text: 'دخول',
              ),
              const SizedBox(
                height: 25,
              ),
              TextButton(
                onPressed: () {
                  Get.to(
                    () => FirstTimeFormScreen(),
                    transition: kTransition1,
                    duration: kTransitionDuration,
                  );
                },
                child: const Text(
                  'إنشاء حساب',
                  style: TextStyle(
                    fontSize: 15,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
