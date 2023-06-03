import 'dart:async';

import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mechanic/data/models/car_model/car_model.dart';

class NotificationHelper {
  static Future<void> initialize(BuildContext context) async {
    // Initialize Awesome Notifications
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic notifications',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
        ),
      ],
    );

    // Check if notification permission is granted
    bool permissionGranted = await AwesomeNotifications().isNotificationAllowed();

    // If permission not granted, show a dialog to enable it
    if (!permissionGranted) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('تمكين الإشعارات'),
            content: const Text('يرجى تمكين الإشعارات لهذا التطبيق.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('إلغاء'),
              ),
              TextButton(
                onPressed: () {
                  openNotificationSettings();
                  Navigator.of(context).pop();
                  initialize(context); // Call initialize recursively
                },
                child: const Text('الإعدادات'),
              ),
            ],
          );
        },
      );
    }
  }

  static void openNotificationSettings() {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }

  static showOilNotification(CarModel car) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: '${car.carName} تحتاج لتغيير الزيت ',
        body: 'التاخير في غيار الزيت يؤثر على السياره',
      ),
    );
  }

  static  showCheckNotification(CarModel car) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'basic_channel',
        title: '${car.carName} تحتاج للصيانة ',
        body: 'التاخير في الصيانة يؤثر على السياره',
      ),
    );
  }
}
