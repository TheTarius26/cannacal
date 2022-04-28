import 'package:cannacal/app/data/model/difficulty.dart';
import 'package:cannacal/app/data/model/high_score.dart';

class DifficultyProvider {
  Future<List<Difficulty>> getListGameSetting(HighScore highScore) async {
    return [
      Difficulty.veryEasy(highScore: highScore.veryEasy),
      Difficulty.easy(highScore: highScore.easy),
      Difficulty.medium(highScore: highScore.medium),
      Difficulty.hard(highScore: highScore.hard),
    ];
  }
}
