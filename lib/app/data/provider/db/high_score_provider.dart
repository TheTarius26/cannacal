import 'package:cannacal/app/data/enum/difficulty.dart';
import 'package:cannacal/app/data/model/high_score.dart';
import 'package:cannacal/app/data/provider/hive/box_constant.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HighScoreProvider extends GetConnect {
  Future<void> saveSingleHighScore(String difficulty, int highScore) async {
    await Hive.initFlutter();
    final box = await Hive.openBox(highScoreBox);
    int previousHighScore = box.get(difficulty) ?? 0;
    int newHighScore = previousHighScore + highScore;

    box.put(difficulty, newHighScore);
  }

  Future<int> getHighScoreByDifficulty(String difficulty) async {
    await Hive.initFlutter();
    final box = await Hive.openBox(highScoreBox);

    return box.get(difficulty) ?? 0;
  }

  Future<HighScore> getAllHighScores() async {
    await Hive.initFlutter();
    final box = await Hive.openBox(highScoreBox);

    return HighScore(
      veryEasy: box.get(Difficulty.veryEasy),
      easy: box.get(Difficulty.easy),
      medium: box.get(Difficulty.medium),
      hard: box.get(Difficulty.hard),
    );
  }

  Future<void> deleteHighScore() async {
    await Hive.initFlutter();
    final box = await Hive.openBox(highScoreBox);

    box.delete(Difficulty.veryEasy);
    box.delete(Difficulty.easy);
    box.delete(Difficulty.medium);
    box.delete(Difficulty.hard);
  }
}
