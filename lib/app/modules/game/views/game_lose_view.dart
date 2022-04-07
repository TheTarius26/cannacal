import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:cannacal/app/modules/game/widgets/game_modal_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GameLoseView extends GetView<GameController> {
  const GameLoseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(kPadding / 2),
        margin: const EdgeInsets.all(kPadding),
        height: Get.height * .2,
        width: Get.width * .6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(
              child: Text(
                'You Lose!',
                style: textStyle.copyWith(
                  fontSize: 24,
                  color: colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            rowButton(),
          ],
        ),
      ),
    );
  }

  Row rowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GameModalButton(
          onPressed: () {
            Get.back();
          },
          text: 'Home',
          color: colorPrimary,
        ),
        GameModalButton(
          onPressed: () {
            Get.back();
            controller.restart();
          },
          text: 'Try Again',
          color: colorSecondary,
        ),
      ],
    );
  }
}
