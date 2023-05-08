import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/bindings.dart';
import 'package:mechanic/core/theme/theme.dart';
import 'package:mechanic/data/data_sources/hive_helper.dart';
import 'package:mechanic/features/auth/view/login_screen.dart';
import 'package:mechanic/features/home/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar_EG', null);

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
      theme: appTheme(context),
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
