import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mechanic/core/colors_manager.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({Key? key, this.onTap, required this.title, this.icon})
      : super(key: key);

  final void Function()? onTap;
  final String title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: ColorsManager.grey,
      title: Text(
        title,
        style: const TextStyle(
          color: ColorsManager.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        if (onTap != null) {
          ///[Get.back()]
          ///to close drawer and then do onTap
          Get.back();
          onTap!();
        }
      },
      leading: icon,
    );
  }
}
