import 'package:cannacal/app/data/model/high_score.dart';
import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/db/high_score_provider.dart';
import 'package:cannacal/app/data/provider/local/option_provider.dart';

class GameRepository {
  final OptionProvider _optionProvider;
  final HighScoreProvider _highScoreProvider;

  GameRepository({
    required OptionProvider optionProvider,
    required HighScoreProvider highScoreProvider,
  })  : _optionProvider = optionProvider,
        _highScoreProvider = highScoreProvider;

  Future<List<Option>> options(int matrix, int point) async =>
      await _optionProvider.getAllOptions(matrix, point);

  Future<void> saveHighScore(HighScore highScore) async =>
      await _highScoreProvider.insertHighScore(highScore);
}
