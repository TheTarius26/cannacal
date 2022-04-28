import 'package:cannacal/app/data/model/difficulty.dart';
import 'package:cannacal/app/data/provider/local/difficulty_provider.dart';

class DifficultyRepository {
  final DifficultyProvider _difficultyProvider;
  DifficultyRepository({required DifficultyProvider difficultyProvider})
      : _difficultyProvider = difficultyProvider;

  Future<List<Difficulty>> getListGameSetting() async {
    return await _difficultyProvider.getListGameSetting();
  }
}
