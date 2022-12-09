import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/rating_view.dart';
import 'package:flutter/material.dart';

class CustomerReviewView extends StatelessWidget {
  const CustomerReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewerNameView(),
        SizedBox(height: MARGIN_MEDIUM),
        RatingView(),
        SizedBox(height: MARGIN_MEDIUM),
        ReviewTextView(),
      ],
    );
  }
}

class ReviewTextView extends StatelessWidget {
  const ReviewTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Very Good..... I love this product.",
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
    );
  }
}

class ReviewerNameView extends StatelessWidget {
  const ReviewerNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Maung Maung",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(0, 0, 0, 0.6),
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          "2022-12-07",
          style: TextStyle(
            fontSize: TEXT_13,
            color: BOTTOM_SHEET_ICON_COLOR,
          ),
        ),
      ],
    );
  }
}
