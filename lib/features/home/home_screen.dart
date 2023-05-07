import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/cars/view/create_car_screen.dart';
import 'package:mechanic/features/cars/view/widgets/cars_list.dart';
import 'package:mechanic/features/home/widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  UserModel user() => HiveHelper.hiveGetUserModelFromLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: HomeDrawer(
        user: user(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: const Text(
          'المساعد الفني',
          style: TextStyle(
            color: ColorsManager.primary,
          ),
        ),
        actions: const [
         _CreateCarButton(),
        ],
      ),
      body: const CarsList(),
    );
  }
}
class _CreateCarButton extends StatelessWidget {
  const _CreateCarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: FloatingActionButton(
        mini: true,
        elevation: 1,
        onPressed: () {
          Get.to(
                () => const CreateCar(),
            transition: kTransition1,
            duration: kTransitionDuration,
          );
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: ColorsManager.primary,
        ),
      ),
    );
  }
}
