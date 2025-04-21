import 'dart:io';

import 'package:hive/hive.dart';

part 'profile.g.dart';

@HiveType(typeId: 0)
class Profile extends HiveObject  {
  Profile({
    required this.image,
    required this.name,
    required this.bio,
  });
  @HiveField(0)
  String  ? image;
  @HiveField(1)
  String name;
  @HiveField(3)
  String bio;
}