import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductListTitleView extends StatelessWidget {

  final String title;


  ProductListTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: TEXT_REGULAR_2X,
      ),
    );
  }
}
