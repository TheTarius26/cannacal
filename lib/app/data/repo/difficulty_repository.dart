import 'package:cannacal/app/data/enum/difficulty.dart';
import 'package:cannacal/app/data/model/game_setting.dart';
import 'package:cannacal/app/data/provider/db/high_score_provider.dart';
import 'package:cannacal/app/data/provider/local/difficulty_provider.dart';

class DifficultyRepository {
  final DifficultyProvider _difficultyProvider;
  final HighScoreProvider _highScoreProvider;

  DifficultyRepository({
    required DifficultyProvider difficultyProvider,
    required HighScoreProvider highScoreProvider,
  })  : _difficultyProvider = difficultyProvider,
        _highScoreProvider = highScoreProvider;

  Future<List<GameSetting>> getListGameSetting() async =>
      await _difficultyProvider.getListGameSetting();

  Future<int> getHighScoreByDifficulty(String difficulty) async =>
      await _highScoreProvider.getHighScoreByDifficulty(difficulty);
}
