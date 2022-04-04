// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:math';

import 'package:cannacal/app/core/utils/number.dart';
import 'package:get/get.dart';

class Option {
  String id;
  int value;
  int row;

  Option({
    required this.id,
    required this.value,
    required this.row,
  });

  static List<Option> createNumberList(int matrix, int point) {
    final unMergedList = <List<Option>>[];
    final result = <Option>[];
    final listCorrect = Option.listCorrect(matrix, point);

    for (int i = 0; i < matrix; i++) {
      final tempList = <Option>[];

      for (int j = 0; j < matrix; j++) {
        final option = Option(
          id: '$i-$j',
          value: Random().nextInt(point),
          row: i,
        );
        if (j % matrix == 0) {
          option.value = listCorrect[i];
        }
        tempList.add(option);
      }

      unMergedList.add(tempList);
    }

    for (var element in unMergedList) {
      element.shuffle();
      result.addAll(element);
    }

    return result;
  }

  static List<int> listCorrect(int matrix, int point) {
    final random = Random();
    List<int> list = [];
    int range = (point / 2).floor();
    int curatedPoint = point;

    for (int i = 0; i < matrix; i++) {
      if (i + 1 == matrix) {
        list.add(curatedPoint);
        break;
      }
      int randomNumber = 0;
      if (curatedPoint < range) {
        randomNumber = random.nextInt(curatedPoint);
      } else {
        randomNumber = random.nextInt(range);
      }
      list.add(randomNumber);
      curatedPoint -= randomNumber;
    }

    return list;
  }
}
