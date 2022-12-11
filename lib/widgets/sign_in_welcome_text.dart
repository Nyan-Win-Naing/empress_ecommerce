import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SignInWelcomeText extends StatelessWidget {

  final String title;


  SignInWelcomeText({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: MARGIN_MEDIUM_3,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }
}
