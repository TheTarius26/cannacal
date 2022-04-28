import 'package:cannacal/app/data/model/game_setting.dart';
import 'package:cannacal/app/modules/difficulty/widgets/difficulty_item.dart';
import 'package:get/get.dart';

class DifficultyController extends GetxController {
  List<DifficultyItem> difficultyList() {
    final list = GameSetting.getListGameSetting();
    return List.generate(
      list.length,
      (index) => DifficultyItem(
        highScore: '9999999999',
        gameSetting: list[index],
      ),
    );
  }
}
