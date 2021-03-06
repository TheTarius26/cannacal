import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/data/model/game_setting.dart';
import 'package:cannacal/app/modules/difficulty/controllers/difficulty_controller.dart';
import 'package:cannacal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DifficultyItem extends GetView<DifficultyController> {
  const DifficultyItem({
    Key? key,
    required this.highScore,
    required this.gameSetting,
  }) : super(key: key);

  final String highScore;
  final GameSetting gameSetting;

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
              if (controller.isAdInterstitialLoaded.value) {
                interstitialAd();
                controller.interstitialAd!.show();
              } else {
                goToGame();
              }
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

  void interstitialAd() {
    controller.interstitialAd!.fullScreenContentCallback =
        FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        goToGame();
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        ad.dispose();
      },
    );
  }

  void goToGame() {
    Get.offNamed(Routes.GAME, arguments: gameSetting);
  }
}
