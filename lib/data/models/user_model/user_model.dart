import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String token;
  @HiveField(3)
  final String imageUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.token,
    this.imageUrl = 'https://static.thenounproject.com/png/4188723-200.png',
  });
}
