import 'package:get/get.dart';

import '../modules/difficulty/bindings/difficulty_binding.dart';
import '../modules/difficulty/views/difficulty_view.dart';
import '../modules/game/bindings/game_binding.dart';
import '../modules/game/views/game_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DIFFICULTY;

  static final routes = [
    GetPage(
      name: _Paths.GAME,
      page: () => const GameView(),
      binding: GameBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DIFFICULTY,
      page: () => DifficultyView(),
      binding: DifficultyBinding(),
    ),
  ];
}
