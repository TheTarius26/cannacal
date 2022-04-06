import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameTable extends GetView<GameController> {
  const GameTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final matrix = controller.matrix.value;
    return Obx(
      () => GridView.builder(
        itemCount: controller.listOption.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: matrix,
          childAspectRatio: 1,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return button(index);
        },
      ),
    );
  }

  Obx button(int index) {
    final option = controller.listOption[index];
    return Obx(
      () => InkWell(
        onTap: controller.onTapButton(index, option.row),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: controller.changeColorPressed(index),
          ),
          child: Center(
            child: Text(
              '${option.value}',
              style: textStyle.copyWith(
                fontSize: 24,
                color: colorSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
