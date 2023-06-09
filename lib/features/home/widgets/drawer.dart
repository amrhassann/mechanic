import 'package:flutter/material.dart';
import 'package:font_awesome_flutter_named/font_awesome_flutter_named.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/data/data_sources/auth_remote_data_source.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/auth/view/login_screen.dart';
import 'package:mechanic/features/emergency/emergency_numbers_list.dart';
import 'package:mechanic/features/home/widgets/drawer_tile.dart';
import 'package:mechanic/features/near_workshop/near_workshops_screen.dart';
import 'package:mechanic/features/profile/view/profile_screen.dart';
import 'package:mechanic/features/q_and_a/view/questions_screen.dart';

class HomeDrawer extends StatelessWidget {
  final UserModel user;

  const HomeDrawer({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: ColorsManager.primary),
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(user.imageUrl),
              backgroundColor: ColorsManager.white,
            ),
            arrowColor: ColorsManager.primary,
            onDetailsPressed: () {
              Get.back();
              Get.to(
                () => ProfileScreen(user: user),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          const SizedBox(height: 30),
          DrawerTile(
            title: 'الرئيسية',
            icon: const Icon(Icons.home_filled),
            onTap: () {},
          ),
          DrawerTile(
            title: 'أقرب ورشة',
            icon: Icon(faIconNameMapping['wrench']!),
            onTap: () {
              Get.to(
                () => const NearWorkShopScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          DrawerTile(
            title: 'أرقام الطوارئ',
            icon: const Icon(Icons.emergency),
            onTap: () {
              Get.to(
                () =>  EmergencyNumbersScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          DrawerTile(
            title: 'الاسئلة الشائعة',
            icon: const Icon(Icons.question_answer),
            onTap: () {
              Get.to(
                () => const QuestionsScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          const Spacer(),
          DrawerTile(
            titleFontWeight: null,
            title: 'تسجيل الخروج',
            icon: const Icon(Icons.logout),
            onTap: () {
              BaseAuthRemoteDataSource source = AuthRemoteDataSource();
              source.logout().then((value) {
                Get.offAll(
                  () => LoginScreen(),
                  transition: kTransition1,
                  duration: kTransitionDuration,
                );
              });
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
