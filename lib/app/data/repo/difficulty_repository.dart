import 'package:cannacal/app/data/model/difficulty.dart';
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

  Future<List<Difficulty>> getListGameSetting() async {
    return await _difficultyProvider.getListGameSetting(
      await _highScoreProvider.getHighScore(),
    );
  }
}
