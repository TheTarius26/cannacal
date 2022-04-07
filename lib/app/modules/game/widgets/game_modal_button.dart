import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameModalButton extends StatelessWidget {
  const GameModalButton({
    Key? key,
    this.onPressed,
    required this.text,
    required this.color,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * .25,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: Colors.white,
        ),
      ),
    );
  }
}
