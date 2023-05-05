import 'package:flutter/material.dart';
import 'package:font_awesome_flutter_named/font_awesome_flutter_named.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/colors_manager.dart';
import 'package:mechanic/core/constants.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/features/home/widgets/drawer_tile.dart';
import 'package:mechanic/features/near_workshop/near_workshops_screen.dart';
import 'package:mechanic/features/profile/view/profile_screen.dart';

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
                () => const NearWorkShopScreen(),
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
                () => const NearWorkShopScreen(),
                transition: kTransition1,
                duration: kTransitionDuration,
              );
            },
          ),
          const Spacer(),
          DrawerTile(
            title: 'تسجيل الخروج',
            icon: const Icon(Icons.logout),
            onTap: () {
              //todo
            },
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
