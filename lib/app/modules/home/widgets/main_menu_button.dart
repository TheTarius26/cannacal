import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:cannacal/app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final ButtonStyle? style;

  const MainMenuButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      margin: const EdgeInsets.only(bottom: kPadding * 2),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: kPadding / 1.5),
          child: Text(
            text,
            style: textStyle.copyWith(
              fontSize: 14,
              color: colorSurface,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        style: style ??
            ElevatedButton.styleFrom(
              primary: colorPrimaryAccent,
            ),
      ),
    );
  }
}
