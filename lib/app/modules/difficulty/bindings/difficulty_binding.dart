import 'package:cannacal/app/data/provider/db/high_score_provider.dart';
import 'package:cannacal/app/data/provider/local/difficulty_provider.dart';
import 'package:cannacal/app/data/repo/difficulty_repository.dart';
import 'package:get/get.dart';

import '../controllers/difficulty_controller.dart';

class DifficultyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DifficultyController>(
      () => DifficultyController(
        difficultyRepository: Get.find<DifficultyRepository>(),
      ),
    );
    Get.lazyPut(
      () => DifficultyRepository(
        difficultyProvider: Get.find<DifficultyProvider>(),
      ),
    );
    Get.lazyPut(
      () => DifficultyProvider(
        highScoreProvider: Get.find<HighScoreProvider>(),
      ),
    );
    Get.lazyPut(() => HighScoreProvider());
  }
}
