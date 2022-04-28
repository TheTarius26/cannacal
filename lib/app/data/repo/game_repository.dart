import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/local/option_provider.dart';

class GameRepository {
  final OptionProvider _optionProvider;
  GameRepository({required OptionProvider optionProvider})
      : _optionProvider = optionProvider;

  Future<List<Option>> options(int matrix, int point) async =>
      await _optionProvider.getAllOptions(matrix, point);
}
