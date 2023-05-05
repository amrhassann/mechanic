import 'package:flutter/material.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';
import 'package:mechanic/widgets/animated_column.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الشخصيه'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedColumn(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(user.imageUrl),
                  backgroundColor: ColorsManager.white,
                ),
                const SizedBox(height: 16),
                Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
