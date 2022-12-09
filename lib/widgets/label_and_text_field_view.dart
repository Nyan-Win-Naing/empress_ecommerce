import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class LabelAndTextFieldView extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;

  LabelAndTextFieldView({
    required this.label,
    required this.hintText,
    this.isPasswordField = false,
  });

  @override
  State<LabelAndTextFieldView> createState() => _LabelAndTextFieldViewState();
}

class _LabelAndTextFieldViewState extends State<LabelAndTextFieldView> {
  bool isHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        TextField(
          obscureText: widget.isPasswordField ? isHidePassword : false,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: BORDER_COLOR),
              ),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: BORDER_COLOR),
              ),
              suffixIcon: widget.isPasswordField ? IconButton(
                onPressed: () {
                  setState(() {
                    isHidePassword = !isHidePassword;
                  });
                },
                icon: Icon(
                  isHidePassword ? Icons.remove_red_eye : Icons.password,
                ),
              ) : null,
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: TEXT_REGULAR,
                color: BOTTOM_SHEET_ICON_COLOR,
              )),
        ),
      ],
    );
  }
}