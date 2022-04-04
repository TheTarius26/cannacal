import 'package:cannacal/app/data/provider/option_provider.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class GameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
    Get.lazyPut(() => OptionProvider());
  }
}
