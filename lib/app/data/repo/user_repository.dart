import 'package:cannacal/app/data/model/user.dart';
import 'package:cannacal/app/data/provider/db/user_provider.dart';

class UserRepository {
  final UserProvider _userProvider;

  UserRepository({required UserProvider userProvider})
      : _userProvider = userProvider;

  Future<User> getUser() async => await _userProvider.getUser();

  Future<void> updateUser(User user) async =>
      await _userProvider.updateUser(user);

  Future<void> updateUserHighScore(int highScore) async =>
      await _userProvider.updateUserHighScore(highScore);

  Future<void> deleteUser() async => await _userProvider.deleteUser();
}
