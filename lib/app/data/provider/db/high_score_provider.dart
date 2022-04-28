import 'package:cannacal/app/data/model/high_score.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HighScoreProvider {
  final String _boxName = 'high_score';

  Future<void> insertHighScore(HighScore highScore) async {
    await Hive.initFlutter();
    final box = await Hive.openBox(_boxName);

    box.put('very_easy', highScore.veryEasy);
    box.put('easy', highScore.easy);
    box.put('medium', highScore.medium);
    box.put('hard', highScore.hard);
  }

  Future<HighScore> getHighScore() async {
    await Hive.initFlutter();
    final box = await Hive.openBox(_boxName);

    return HighScore(
      veryEasy: box.get('very_easy') ?? 0,
      easy: box.get('easy') ?? 0,
      medium: box.get('medium') ?? 0,
      hard: box.get('hard') ?? 0,
    );
  }

  Future<void> deleteHighScore() async {
    await Hive.initFlutter();
    final box = await Hive.openBox(_boxName);

    box.delete('very_easy');
    box.delete('easy');
    box.delete('medium');
    box.delete('hard');
  }
}
