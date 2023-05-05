import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mechanic/features/emergency/emergency_number_card.dart';

class EmergencyNumbersScreen extends StatelessWidget {
  final List<Map<String, dynamic>> emergencyNumbers = [
    {'name': 'الشرطة', 'number': '122'},
    {'name': 'الإسعاف', 'number': '123'},
    {'name': 'الدفاع المدني', 'number': '180'},
    {'name': 'الشرطة السياحية', 'number': '126'},
    {'name': 'الشرطة المرورية', 'number': '128'},
    {'name': 'طوارئ الكهرباء', 'number': '121'},
    {'name': 'طوارئ الغاز', 'number': '129'},
    {'name': 'طوارئ المياه', 'number': '125'},
  ];

  EmergencyNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أرقام الطوارئ'),
      ),
      body: FadeIn(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemCount: emergencyNumbers.length,
          itemBuilder: (context, index) {
            return EmergencyNumberCard(
              emergencyNumber: emergencyNumbers[index],
            );
          },
        ),
      ),
    );
  }
}
