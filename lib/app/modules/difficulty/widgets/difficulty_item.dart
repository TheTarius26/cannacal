import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/data/model/difficulty.dart';
import 'package:cannacal/app/modules/difficulty/controllers/difficulty_controller.dart';
import 'package:cannacal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DifficultyItem extends GetView<DifficultyController> {
  const DifficultyItem({
    Key? key,
    required this.highScore,
    required this.gameSetting,
  }) : super(key: key);

  final String highScore;
  final Difficulty gameSetting;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      margin: const EdgeInsets.symmetric(vertical: kPadding),
      height: Get.width * 0.5,
      width: Get.width * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            gameSetting.title,
            style: textStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: kPadding),
          Text(
            'High score \n$highScore',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: textStyle.copyWith(
              fontSize: 14,
              color: colorSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: colorSecondary,
              padding: const EdgeInsets.symmetric(
                horizontal: kPadding * 2,
              ),
            ),
            onPressed: () {
              Get.offNamed(Routes.GAME, arguments: gameSetting);
            },
            child: Text(
              'Play',
              style: textStyle.copyWith(
                fontSize: 18,
                color: colorSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
