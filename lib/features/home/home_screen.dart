import 'package:flutter/material.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/home/widgets/drawer.dart';
import 'package:mechanic/features/home/widgets/no_cars.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  UserModel user() => HiveHelper.hiveGetUserModelFromLocal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(
        user: user(),
      ),
      appBar: AppBar(
        title: const Text(
          'المساعد الفني',
          style: TextStyle(
            color: ColorsManager.primary,
          ),
        ),
      ),
      body: HomeNoCars(),
    );
  }
}
