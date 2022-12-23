import 'package:flutter/material.dart';

void navigateToNextPage(BuildContext context, Widget nextPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => nextPage,
    ),
  );
}