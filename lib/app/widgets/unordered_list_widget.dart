import 'package:cannacal/app/core/theme/color_theme.dart';
import 'package:cannacal/app/core/theme/text_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(
      {Key? key,
      this.textType = ListTextType.normal,
      this.url,
      required this.text})
      : super(key: key);
  final String text;
  final ListTextType textType;
  final String? url;

  void _launchUrl() async {
    if (!await launchUrlString(
      url ?? '',
    )) throw "cannot open the link";
  }

  RichText getText() {
    switch (textType) {
      case ListTextType.url:
        return RichText(
            text: TextSpan(
                text: text,
                style: textStyle.copyWith(
                  color: colorSecondary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    _launchUrl();
                  }));
      default:
        return RichText(
          text: TextSpan(
            text: text,
            style: textStyle.copyWith(
              color: colorPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text("• "),
        Expanded(
          child: getText(),
        ),
      ],
    );
  }
}

enum ListTextType { normal, url, noDecorUrl, bold, custom }
