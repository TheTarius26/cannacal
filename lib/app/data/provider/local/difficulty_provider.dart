import 'package:cannacal/app/data/model/difficulty.dart';
import 'package:cannacal/app/data/provider/db/high_score_provider.dart';

class DifficultyProvider {
  final HighScoreProvider _highScoreProvider;

  DifficultyProvider({required HighScoreProvider highScoreProvider})
      : _highScoreProvider = highScoreProvider;

  Future<List<Difficulty>> getListGameSetting() async {
    final highScore = await _highScoreProvider.getHighScore();
    return [
      Difficulty.veryEasy(
        highScore: highScore.veryEasy,
      ),
      Difficulty.easy(
        highScore: highScore.easy,
      ),
      Difficulty.medium(
        highScore: highScore.medium,
      ),
      Difficulty.hard(
        highScore: highScore.hard,
      ),
    ];
  }
}
