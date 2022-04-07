import 'package:get/get.dart';

import '../controllers/difficulty_controller.dart';

class DifficultyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DifficultyController>(
      () => DifficultyController(),
    );
  }
}
