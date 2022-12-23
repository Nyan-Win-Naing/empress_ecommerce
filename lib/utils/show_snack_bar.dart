import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackBarWithMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 500),
    ),
  );
}