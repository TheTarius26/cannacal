import 'dart:async';

import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/option_provider.dart';
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
  final gameDuration = 180.obs;

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
        }

        if (listRowTapped.length == matrix.value) {
          showResetButton.value = true;
          if (lives.value < 1) {
            onLose();
          }
        }
      };
    } else {
      return null;
    }
  }

  void onWin() {
    Get.bottomSheet(
      Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            'You Win!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      isDismissible: false,
      enableDrag: false,
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
      return Colors.green.shade100;
    } else if (listRowTapped.contains(listOption[index].row)) {
      return Colors.red.shade100;
    } else {
      return Colors.blue.shade100;
    }
  }
}
