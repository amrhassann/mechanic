import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/bindings.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/features/auth/view/login_screen.dart';
import 'package:mechanic/features/home/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await HiveHelper.hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.grey),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: ColorsManager.primary,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      home: controlView(),
    );
  }
}

Widget controlView() {
  if (HiveHelper.getUserToken() == null) {
    return LoginScreen();
  } else {
    return const HomeScreen();
  }
}
