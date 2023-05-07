import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/features/cars/controller/get_cars_controller.dart';
import 'package:mechanic/features/cars/view/widgets/car_item_card.dart';
import 'package:mechanic/features/home/widgets/no_cars.dart';
import 'package:mechanic/widgets/loading/main_loading.dart';

class CarsList extends StatelessWidget {
  const CarsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetCarsController>(
        init: GetCarsController(),
        builder: (controller) {
          if (controller.loading) {
            return const MainLoading();
          } else {
            if (controller.cars.isEmpty) {
              return const HomeNoCars();
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.cars.length,
                itemBuilder: (c, i) => CarItemCard(car: controller.cars[i],),
              );
            }
          }
        });
  }
}
