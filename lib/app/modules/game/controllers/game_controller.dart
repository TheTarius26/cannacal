import 'dart:async';

import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/option_provider.dart';
import 'package:cannacal/app/modules/game/views/game_win_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  // Provider
  final OptionProvider _optionProvider = Get.find<OptionProvider>();

  // State controller
  final listRowTapped = <int>[].obs;
  final listIndexTapped = <int>[].obs;
  final listOption = <Option>[].obs;
  final showResetButton = false.obs;

  // Game preferences
  final lives = 5.obs;
  final matrix = 3.obs;
  final point = 100.obs;
  final baseGameDuration = 180;
  final gameDuration = 0.obs;
  final score = 0.obs;

  @override
  void onInit() {
    super.onInit();
    gameDuration.value = baseGameDuration;
  }

  @override
  void onReady() async {
    super.onReady();
    timerStart();
    listOption.value = await _optionProvider.getAllOptions(
      matrix.value,
      point.value,
    );
  }

  void timerStart() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (gameDuration.value == 0) {
        timer.cancel();
        onLose();
      } else if (lives.value == 0 || point.value == 0) {
        timer.cancel();
        return;
      } else {
        gameDuration.value--;
      }
    });
  }

  void onReset() {
    point.value = 100;
    listRowTapped.value = <int>[];
    listIndexTapped.value = <int>[];
    showResetButton.value = false;
    --lives.value;
  }

  void Function()? onTapOption(int index, int row) {
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

  void onWin() {
    Get.bottomSheet(
      const GameWinView(),
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
    );
    return;
  }

  void onLose() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'You Lose!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      isDismissible: false,
    );
    return;
  }

  Color optionColor(int index) {
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
}
