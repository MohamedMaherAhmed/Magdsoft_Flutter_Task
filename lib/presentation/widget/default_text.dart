import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
      {Key? key,
        required this.text,
        this.textColor,
        this.textFontSize,
        this.textFontWeight})
      : super(key: key);

  final String text;
  final Color? textColor;
  final double? textFontSize;
  final FontWeight? textFontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: textColor,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
        ),
        softWrap: true);
  }
}