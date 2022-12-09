import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      ignoreGestures: true,
      initialRating: 4.0,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: Colors.amber,
        );
      },
      itemSize: MARGIN_MEDIUM_2,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
