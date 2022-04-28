import 'package:cannacal/app/data/repo/difficulty_repository.dart';
import 'package:cannacal/app/modules/difficulty/widgets/difficulty_item.dart';
import 'package:get/get.dart';

class DifficultyController extends GetxController {
  final DifficultyRepository _difficultyRepository;

  DifficultyController({required DifficultyRepository difficultyRepository})
      : _difficultyRepository = difficultyRepository;

  final listDifficulty = <DifficultyItem>[].obs;

  @override
  void onReady() {
    super.onReady();
    getDifficultyList();
  }

  void getDifficultyList() async {
    final list = await _difficultyRepository.getListGameSetting();
    listDifficulty.value = List.generate(
      list.length,
      (index) => DifficultyItem(
        highScore: list[index].highScore.toString(),
        gameSetting: list[index],
      ),
    );
  }
}
