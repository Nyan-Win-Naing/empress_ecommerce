import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class CategoryChipView extends StatelessWidget {

  final CategoryVO category;


  CategoryChipView({required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
      child: Chip(
        label: Text(
          category.category ?? "",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: (category.isSelected ?? false) ? Colors.white : SECONDARY_DARK_COLOR,
          ),
        ),
        backgroundColor: (category.isSelected ?? false) ? Colors.blue : CATEGORY_CHIP_COLOR,
      ),
    );
  }
}
