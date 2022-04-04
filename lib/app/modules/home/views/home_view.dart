import 'package:flutter/material.dart';
import 'package:cannacal/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            hud(),
            const SizedBox(height: 16),
            pointText(),
            const SizedBox(height: 16),
            gameOption(),
            const SizedBox(height: 16),
            resetButton(),
            const Spacer(),
          ],
        ),
      ),
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
        () => Text(
          '${controller.point.value}',
          style: const TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }

  Expanded hud() {
    return Expanded(
      flex: 0,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Lives: ${controller.lives.value}'),
          ],
        ),
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

class GridOption extends GetView<HomeController> {
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
                  color: controller.cellColor(index),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 4,
                      offset: const Offset(5, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '${option.value}',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
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
