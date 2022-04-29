import 'package:cannacal/app/data/model/game_setting.dart';

class DifficultyProvider {
  Future<List<GameSetting>> getListGameSetting() async {
    return [
      GameSetting.veryEasy(),
      GameSetting.easy(),
      GameSetting.medium(),
      GameSetting.hard(),
    ];
  }
}
