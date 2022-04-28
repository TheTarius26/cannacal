import 'package:cannacal/app/data/model/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserProvider {
  final String _boxName = 'user';

  Future<User> getUser() async {
    await Hive.initFlutter();
    var box = await Hive.openBox(_boxName);
    final user = User(
      highScore: box.get('highScore') ?? 0,
    );
    return user;
  }

  Future<void> updateUser(User user) async {
    await Hive.initFlutter();
    var box = await Hive.openBox(_boxName);
    box.put('highScore', user.highScore);
  }

  Future<void> updateUserHighScore(int highScore) async {
    await Hive.initFlutter();
    var box = await Hive.openBox(_boxName);
    box.put('highScore', highScore);
  }

  Future<void> deleteUser() async {
    await Hive.initFlutter();
    var box = await Hive.openBox(_boxName);
    box.delete('highScore');
  }
}
