import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyNumberCard extends StatelessWidget {
  const EmergencyNumberCard({Key? key, required this.emergencyNumber})
      : super(key: key);

  final Map<String, dynamic> emergencyNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String phoneNumber = 'tel:${emergencyNumber['number']}';
        launchUrl(Uri.parse(phoneNumber));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                emergencyNumber['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                emergencyNumber['number'],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
