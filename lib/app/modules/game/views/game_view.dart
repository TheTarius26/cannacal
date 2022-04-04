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
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          children: [
            const SizedBox(height: kPadding),
            hud(),
            const SizedBox(height: kPadding * 2),
            pointText(),
            const SizedBox(height: kPadding),
            gameOption(),
            const SizedBox(height: kPadding),
            resetButton(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  AppBar gameAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.home,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      title: Text(
        'Plus Minus',
        style: textStyle.copyWith(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Expanded gameOption() {
    return const Expanded(
      flex: 9,
      child: GridOption(),
    );
  }

  Expanded pointText() {
    return Expanded(
      flex: 2,
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: kPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
              width: 4,
            ),
            color: Colors.white,
          ),
          child: Text(
            '${controller.point.value}',
            style: textStyle.copyWith(fontSize: 50),
          ),
        ),
      ),
    );
  }

  Expanded hud() {
    return Expanded(
      flex: 0,
      child: Obx(
        () {
          final timer = controller.gameDuration.value;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Lives: ${controller.lives.value}',
                style: textStyle,
              ),
              Text(
                'Time left: ${timer ~/ 60}:${timer % 60}',
                style: textStyle,
              ),
            ],
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
          ),
        );
      }
      return Container();
    });
  }
}
