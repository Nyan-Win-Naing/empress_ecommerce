import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String data;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  TextView({
    required this.data,
    this.color = Colors.black,
    this.fontSize = TEXT_REGULAR,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
