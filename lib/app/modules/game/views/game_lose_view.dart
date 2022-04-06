import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:cannacal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GameLoseView extends GetView<GameController> {
  const GameLoseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kPadding),
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 16 / 8,
        child: Container(
          padding: const EdgeInsets.all(kPadding / 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            // border: Border.all(
            //   color: colorPrimary,
            //   width: 5,
            // ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: kPadding),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    child: Text(
                      'Home',
                      style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: colorPrimary,
                      onPrimary: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      controller.restart();
                    },
                    child: Text(
                      'Try Again',
                      style: textStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: colorPrimary,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
