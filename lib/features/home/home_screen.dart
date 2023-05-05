import 'package:flutter/material.dart';
import 'package:mechanic/core/colors_manager.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/home/widgets/drawer.dart';

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
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: .7, color: Colors.grey),
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'لا يوجد سيارات',
                ),
                Text(
                  'أدخل سياره',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
