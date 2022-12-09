import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class CategoryChipView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Chip(
        label: Text(
          "Notebooks",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: SECONDARY_DARK_COLOR,
          ),
        ),
      ),
    );
  }
}
