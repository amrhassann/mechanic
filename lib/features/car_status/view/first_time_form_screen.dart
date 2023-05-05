import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/colors_manager.dart';
import 'package:mechanic/features/car_status/controller/car_status_controller.dart';
import 'package:mechanic/widgets/default_button.dart';
import 'package:mechanic/widgets/text_field.dart';

class FirstTimeFormScreen extends StatelessWidget {
  FirstTimeFormScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controller = Get.put(CarStatusController());

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
                    CustomTextFormField(
                      controller: controller.lastKilometersController,
                      label: 'الكيلومترات في العداد',
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: controller.oilKilometersController,
                      label: 'الكيلومترات المتبقيه على غيار الزيت',
                      isPassword: true,
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: controller.checkKilometersController,
                      label: 'الكيلومترات المتبقيه على الصيانه',
                      isPassword: true,
                      requiredField: true,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GetBuilder<CarStatusController>(builder: (cc) {
                      if (cc.loading) {
                        return const CircularProgressIndicator();
                      } else {
                        return DefaultButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   controller.createNewData();
                            //   Future.delayed(const Duration(seconds: 2),(){
                            //     Get.off(
                            //     () => const HomeScreen(),
                            //     transition: kTransition1,
                            //     duration: kTransitionDuration,
                            //   );
                            // });
                            // }
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
