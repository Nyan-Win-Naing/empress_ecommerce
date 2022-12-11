import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SignInTitleView extends StatelessWidget {

  final String title;


  SignInTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: TEXT_HEADING_1X,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
