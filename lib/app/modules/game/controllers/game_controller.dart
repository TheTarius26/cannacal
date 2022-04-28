import 'dart:async';

import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/data/model/difficulty.dart';
import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/local/option_provider.dart';
import 'package:cannacal/app/data/repo/game_repository.dart';
import 'package:cannacal/app/modules/game/views/game_lose_view.dart';
import 'package:cannacal/app/modules/game/views/game_win_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  final GameRepository _gameRepository;

  GameController({required GameRepository gameRepository})
      : _gameRepository = gameRepository;

  // State controller
  final listRowTapped = <int>[].obs;
  final listIndexTapped = <int>[].obs;
  final listOption = <Option>[].obs;
  final showResetButton = false.obs;
  final isGameOver = false.obs;

  // Game preferences
  final setting = Difficulty().obs;
  final lives = 0.obs;
  final matrix = 0.obs;
  final point = 0.obs;
  final gameDuration = 0.obs;
  final score = 0.obs;

  @override
  void onInit() {
    super.onInit();
    setUp();
  }

  @override
  void onReady() async {
    super.onReady();
    timerStart();
    getOptionList();
  }

  void getOptionList() async {
    listOption.value = await _gameRepository.options(
      matrix.value,
      point.value,
    );
  }

  /// start the timer
  void timerStart() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (gameDuration.value == 0) {
        timer.cancel();
        onLose();
        return;
      } else if (isGameOver.value) {
        timer.cancel();
        return;
      } else {
        gameDuration.value--;
      }
    });
  }

  /// set up on state first initialized for game preferences and state controller
  void setUp() {
    setting.value = Get.arguments;
    gameDuration.value = setting.value.duration;
    lives.value = setting.value.lives;
    matrix.value = setting.value.matrix;
    point.value = setting.value.point;
    isGameOver.value = false;

    if (listRowTapped.isNotEmpty) {
      listRowTapped.clear();
      listIndexTapped.clear();
      listOption.clear();
      showResetButton.value = false;
    }
  }

  /// state when game reset to normal but lose 1 lives
  void onReset() {
    point.value = setting.value.point;
    listRowTapped.value = <int>[];
    listIndexTapped.value = <int>[];
    showResetButton.value = false;
    --lives.value;
  }

  /// listener when option button pressed
  void Function()? onTapButton(int index, int row) {
    if (!listRowTapped.contains(row)) {
      return () {
        listRowTapped.add(row);
        listIndexTapped.add(index);
        point.value -= listOption[index].value;

        if (point.value == 0) {
          onWin();
          return;
        }

        if (listRowTapped.length == matrix.value) {
          if (lives.value == 0) {
            onLose();
            return;
          }
          showResetButton.value = true;
          return;
        }
      };
    } else {
      return null;
    }
  }

  /// state when the game is win
  void onWin() {
    isGameOver.value = true;
    Get.bottomSheet(
      const GameWinView(),
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
    );
  }

  /// state when the game is lose
  void onLose() {
    isGameOver.value = true;
    Get.bottomSheet(
      const GameLoseView(),
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
    );
  }

  /// change color for the pressed button
  Color changeColorPressed(int index) {
    if (listIndexTapped.contains(index)) {
      return colorSecondary;
    } else {
      return colorPrimary;
    }
  }

  int timeCalc() {
    return gameDuration.value * 5;
  }

  int liveCalc() {
    return lives.value * 1000;
  }

  int scoreCalc() {
    final tempScore = timeCalc() + liveCalc();
    score.value = tempScore;
    return tempScore;
  }

  void restart() {
    onInit();
  }
}
