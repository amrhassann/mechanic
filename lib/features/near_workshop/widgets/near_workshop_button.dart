import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:mechanic/core/colors_manager.dart';

class NearWorkShopButton extends StatelessWidget {
  const NearWorkShopButton({Key? key, required this.query, required this.title})
      : super(key: key);
  final String query;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          MapsLauncher.launchQuery(query);
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: .7, color: Colors.grey)),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: ColorsManager.primary,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
