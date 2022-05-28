import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/modules/game/widgets/grid_option.dart';
import 'package:cannacal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GameView extends GetView<GameController> {
  const GameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _goToDifficulty,
      child: Scaffold(
        appBar: gameAppBar(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      timer(),
                      lives(),
                    ],
                  ),
                  const SizedBox(height: kPadding),
                  pointText(),
                  const SizedBox(height: kPadding),
                  gameTable(),
                  const SizedBox(height: kPadding),
                ],
              ),
            ),
            bannerAd(),
            resetButton(),
          ],
        ),
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
      child: Obx(() {
        if (controller.isAdBannerLoaded.value) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: controller.bannerAd!.size.width.toDouble(),
                height: controller.bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: controller.bannerAd as AdWithView),
              ),
            ],
          );
        } else {
          return Container();
        }
      }),
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
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: SizedBox(
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
              ),
            ),
            SizedBox(height: kPadding)
          ],
        );
      }
      return Container();
    });
  }

  Future<bool> _goToDifficulty() async {
    return (await Get.offNamed(Routes.DIFFICULTY)) ?? false;
  }
}
