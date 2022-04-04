import 'package:cannacal/app/modules/game/bindings/game_binding.dart';
import 'package:cannacal/app/modules/game/views/game_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const GameView(),
      binding: GameBinding(),
    ),
  ];
}
