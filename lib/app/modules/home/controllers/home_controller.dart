import 'package:cannacal/app/data/model/option.dart';
import 'package:cannacal/app/data/provider/option_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final OptionProvider _optionProvider = Get.find<OptionProvider>();

  final lives = 5.obs;
  final matrix = 3.obs;
  final listRowTapped = <int>[].obs;
  final listOption = <Option>[].obs;
  final point = 100.obs;
  final showResetButton = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    listOption.value = await _optionProvider.getAllOptions(
      matrix.value,
      point.value,
    );
  }

  void onReset() {
    point.value = 100;
    listRowTapped.value = <int>[];
    showResetButton.value = false;
    --lives.value;
  }

  void Function()? onTapOption(int index, int row) {
    if (!listRowTapped.contains(row)) {
      return () {
        Get.printInfo(info: 'Row $row tapped');
        Get.printInfo(
            info: 'row list contains $row? ${listRowTapped.contains(row)}');
        listRowTapped.add(row);
        point.value -= listOption[index].value;

        if (point.value == 0) {
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
        }

        if (listRowTapped.length == matrix.value) {
          showResetButton.value = true;
          if (lives.value < 1) {
            Get.printInfo(info: 'lives: ${lives.value}');
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
            );
          }
        }
      };
    } else {
      return null;
    }
  }

  Color cellColor(int index) {
    return Colors.white60;
  }
}
