import 'package:flutter/material.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/features/near_workshop/widgets/near_workshop_button.dart';

class NearWorkShopScreen extends StatelessWidget {
  const NearWorkShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'أقرب ورشة',
          style: TextStyle(
            color: ColorsManager.primary,
          ),
        ),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          NearWorkShopButton(
            title: 'ميكانيكي',
            query: "اقرب ميكانيكي سيارات",
          ),
          NearWorkShopButton(
            title: 'عفشه',
            query: "اقرب ورشة عفشه",
          ),
          NearWorkShopButton(
            title: 'كهربائي',
            query: "اقرب كهربائي سيارات",
          ),
          NearWorkShopButton(
            title: 'كاوتش',
            query: "اقرب ورشة كاوتش سيارات",
          ),
          NearWorkShopButton(
            title: 'تغيير زيت',
            query: "اقرب ورشة تغيير زيت سيارات",
          ),
          NearWorkShopButton(
            title: 'بنزينه',
            query: "اقرب بنزينه",
          ),
          NearWorkShopButton(
            title: 'مغسله',
            query: "اقرب ورشة مركز صيانة سيارات",
          ),
          NearWorkShopButton(
            title: 'مركز صيانه',
            query: "اقرب ورشة مركز صيانة سيارات",
          ),
        ],
      ),
    );
  }
}
// AnimatedColumn(
// children: [
//
// Row(
// children: const [
// Expanded(
// child: NearWorkShopButton(
// title: 'عفشه',
// query: "اقرب ورشة عفشه",
// ),
// ),
// SizedBox(width: 10),
// Expanded(
// child: NearWorkShopButton(
// title: 'ميكانيكي',
// query: "اقرب ميكانيكي سيارات",
// ),
// ),
// ],
// ),
// const SizedBox(height: 10),
// Row(
// children: const [
// Expanded(
// child: NearWorkShopButton(
// title: 'كهربائي',
// query: "اقرب كهربائي سيارات",
// ),
// ),
// SizedBox(width: 10),
// Expanded(
// child: NearWorkShopButton(
// title: 'كاوتش',
// query: "اقرب ورشة كاوتش سيارات",
// ),
// ),
// ],
// ),
// ],
// ),
