import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/data/model/game_setting.dart';
import 'package:cannacal/app/modules/difficulty/controllers/difficulty_controller.dart';
import 'package:cannacal/app/modules/difficulty/widgets/difficulty_item.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DifficultyView extends GetView<DifficultyController> {
  const DifficultyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorSecondary,
          title: Text(
            'Difficulty',
            style: textStyle.copyWith(
              fontSize: 18,
              color: colorSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: kPadding * 4),
              Center(
                child: Text(
                  'Choose difficulty to play',
                  style: textStyle.copyWith(
                    color: colorPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...difficultyList(),
            ],
          ),
        ),
      ),
    );
  }

  List<DifficultyItem> difficultyList() {
    final list = GameSetting.getListGameSetting();
    return List.generate(
      list.length,
      (index) => DifficultyItem(
        highScore: '9999999999',
        gameSetting: list[index],
      ),
    );
  }
}
