import 'package:cannacal/app/data/provider/db/high_score_provider.dart';
import 'package:cannacal/app/data/provider/local/option_provider.dart';
import 'package:cannacal/app/data/repo/game_repository.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GameController(
        gameRepository: Get.find<GameRepository>(),
      ),
    );
    Get.lazyPut(
      () => GameRepository(
        optionProvider: Get.find<OptionProvider>(),
        highScoreProvider: Get.find<HighScoreProvider>(),
      ),
    );
    Get.lazyPut(() => OptionProvider());
    Get.lazyPut(() => HighScoreProvider());
  }
}
