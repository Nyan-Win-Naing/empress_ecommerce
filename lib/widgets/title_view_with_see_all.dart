import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class TitleViewWithSeeAll extends StatelessWidget {
  final String title;
  final String label;
  final Function onTap;

  TitleViewWithSeeAll({required this.title, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            label,
            style: TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
