import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/manager/lottie_manager.dart';
import 'package:mechanic/features/cars/view/create_car_screen.dart';

class HomeNoCars extends StatelessWidget {
  const HomeNoCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => const CreateCar(),
          transition: kTransition1,
          duration: kTransitionDuration,
        );
      },
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Lottie.asset(
            LottieManager.carShop,
            filterQuality: FilterQuality.low,
          ),
          Container(
            color: Colors.white.withOpacity(.9),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "لم تقم بإضافة سيارات حتى الان",
                  style: TextStyle(color: ColorsManager.primary, fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  "انقر لاضافة سياره",
                  style: TextStyle(
                    color: ColorsManager.grey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
