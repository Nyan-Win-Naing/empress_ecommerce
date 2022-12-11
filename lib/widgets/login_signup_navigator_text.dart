import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class LoginSignupNavigatorText extends StatelessWidget {

  final String label;
  final String navigatorLabel;
  final Function onTap;


  LoginSignupNavigatorText({required this.label, required this.navigatorLabel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: BORDER_COLOR,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorLabel,
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              fontSize: TEXT_REGULAR_2X,
            ),
          ),
        ),
      ],
    );
  }
}
