import 'package:hive/hive.dart';
import 'package:taskbygithub/profile/profile_model/profile.dart';

class UserService {
  static const String _boxName = 'users';

  Future<void> addUser(Profile user) async {
    final box = await Hive.openBox<Profile>(_boxName);
    await box.add(user);
  }

  Future<List<Profile>> getUsers() async {
    final box = await Hive.openBox<Profile>(_boxName);
    return box.values.toList();
  }

  Future<void> updateUser(int index, updatedUser) async {
    final box = await Hive.openBox<Profile>(_boxName);
    await box.putAt(index, updatedUser);
  }

  Future<void> deleteUser(int index) async {
    final box = await Hive.openBox<Profile>(_boxName);
    await box.deleteAt(index);
  }
}
