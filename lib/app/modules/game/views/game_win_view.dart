import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:cannacal/app/modules/game/widgets/game_modal_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GameWinView extends GetView<GameController> {
  const GameWinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(kPadding / 2),
        margin: const EdgeInsets.all(kPadding),
        height: Get.height * .3,
        width: Get.width * .7,
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
                'You Win!',
                style: textStyle.copyWith(
                  fontSize: 24,
                  color: colorPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: kPadding),
            gameSummary(),
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
            Get.offNamed('/difficulty');
          },
          text: 'Home',
          color: colorPrimary,
        ),
        GameModalButton(
          onPressed: () {
            Get.back();
            controller.restart();
          },
          text: 'Play Again',
          color: colorSecondary,
        ),
      ],
    );
  }

  Column gameSummary() {
    return Column(
      children: [
        calcScoreRow('Time completion x 5', controller.timeCalc()),
        const SizedBox(height: kPadding / 4),
        calcScoreRow('Lives left x 1000', controller.liveCalc()),
        Container(
          margin: const EdgeInsets.symmetric(vertical: kPadding / 2),
          color: colorPrimary,
          height: 2,
        ),
        calcScoreRow('Score', controller.scoreCalc()),
      ],
    );
  }

  Row calcScoreRow(String title, int value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textStyle.copyWith(
            fontSize: 14,
            color: colorPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$value',
          style: textStyle.copyWith(
            fontSize: 14,
            color: colorPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
