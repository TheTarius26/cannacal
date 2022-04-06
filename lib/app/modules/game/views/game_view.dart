import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/modules/game/widgets/grid_option.dart';
import 'package:flutter/material.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';

class GameView extends GetView<GameController> {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gameAppBar(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              children: [
                const SizedBox(height: kToolbarHeight),
                timer(),
                const SizedBox(height: kPadding),
                pointText(),
                const SizedBox(height: kPadding),
                lives(),
                const SizedBox(height: kPadding),
                gameTable(),
                const SizedBox(height: kPadding),
                resetButton(),
              ],
            ),
          ),
          bannerAd(),
        ],
      ),
    );
  }

  Obx lives() {
    return Obx(() {
      final lives = controller.lives.value;
      if (lives == 0) {
        return Text(
          'Last Chance!',
          style: textStyle.copyWith(
            color: colorPrimary,
            fontWeight: FontWeight.bold,
          ),
        );
      }
      return Wrap(
        children: List.generate(
          lives,
          (index) => const Icon(
            Icons.favorite,
            color: colorError,
          ),
        ),
      );
    });
  }

  Container bannerAd() {
    return Container(
      color: colorPrimary,
      height: kToolbarHeight,
      alignment: Alignment.center,
      child: Text(
        'Place Ads Here',
        style: textStyle.copyWith(
          fontSize: 16,
          color: colorSurface,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  AppBar gameAppBar() {
    return AppBar(
      backgroundColor: colorSecondary,
      elevation: 0,
      title: Text(
        'Plus Minus',
        style: textStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colorSurface,
        ),
      ),
    );
  }

  Expanded gameTable() {
    return const Expanded(
      flex: 9,
      child: GameTable(),
    );
  }

  Obx pointText() {
    return Obx(
      () => Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(kPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: colorPrimary,
            width: 4,
          ),
          color: Colors.white,
        ),
        child: Text(
          '${controller.point.value}',
          style: textStyle.copyWith(
            fontSize: 30,
            color: colorPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Expanded timer() {
    return Expanded(
      flex: 0,
      child: Obx(
        () {
          final timer = controller.gameDuration.value;
          return Text(
            'Time left: ${timer ~/ 60}:${timer % 60}',
            style: textStyle.copyWith(
              color: colorPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          );
        },
      ),
    );
  }

  Obx resetButton() {
    return Obx(() {
      if (controller.showResetButton.value) {
        return SizedBox(
          height: 40,
          child: ElevatedButton.icon(
            onPressed: controller.onReset,
            icon: const Icon(Icons.refresh),
            label: const Text('Reset'),
            style: ElevatedButton.styleFrom(
              primary: colorPrimary,
              onSurface: colorSurface,
            ),
          ),
        );
      }
      return Container();
    });
  }
}
