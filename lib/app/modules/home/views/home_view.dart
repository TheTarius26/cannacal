import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:cannacal/app/modules/home/widgets/main_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBackground,
        appBar: AppBar(
          backgroundColor: colorSecondary,
          title: Text(
            'Main Menu',
            style: textStyle.copyWith(
              fontSize: 18,
              color: colorSurface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MainMenuButton(
                    text: 'Play',
                    onPressed: () => Get.toNamed('/difficulty'),
                  ),
                  MainMenuButton(
                    text: 'Terms And Condition',
                    onPressed: () => Get.toNamed('/terms'),
                  ),
                  MainMenuButton(
                    text: 'Privacy Policy',
                    onPressed: () => Get.toNamed('/privacy'),
                  ),
                  MainMenuButton(
                    text: 'Exit',
                    onPressed: () => SystemNavigator.pop(),
                  ),
                ],
              ),
            ),
            Obx(() {
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
            })
          ],
        ),
      ),
    );
  }
}
