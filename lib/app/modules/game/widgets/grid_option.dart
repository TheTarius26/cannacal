import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/modules/game/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridOption extends GetView<GameController> {
  const GridOption({Key? key}) : super(key: key);

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
          final option = controller.listOption[index];
          return Obx(
            () => InkWell(
              onTap: controller.onTapOption(index, option.row),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: controller.optionColor(index),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.5),
                  //     blurRadius: 4,
                  //     offset: const Offset(5, 5),
                  //   ),
                  // ],
                  border: Border.all(
                    color: Colors.black.withOpacity(0.5),
                    width: 4,
                  ),
                ),
                child: Center(
                  child: Text(
                    '${option.value}',
                    style: textStyle.copyWith(fontSize: 24),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
