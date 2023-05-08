import 'package:flutter/material.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/data/models/user_model/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
      backgroundColor: Colors.grey.shade100,
        title: const Text('الصفحة الشخصيه'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Card(
                  color: ColorsManager.white,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: .0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                      top: 50,
                    ),
                    child: SizedBox(
                      width: double.infinity  ,
                      child: Column(
                        children: [

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
                    ),
                  )),
              FractionalTranslation(
                  translation: const Offset(0.0, -0.5),
                  child: Align(
                    alignment: const FractionalOffset(0.5, 0.0),
                    child: CircleAvatar(
                      backgroundImage:
                      NetworkImage(user.imageUrl),
                      radius: 40,
                      backgroundColor: ColorsManager.white,
                      // maxRadius: 200.0,
                    ),
                  )),

            ],
          ),
        ),
      ),
    );
  }
}
