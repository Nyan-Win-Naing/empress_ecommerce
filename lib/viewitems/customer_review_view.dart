import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/rating_view.dart';
import 'package:flutter/material.dart';

class CustomerReviewView extends StatelessWidget {

  final ReviewVO? review;


  CustomerReviewView({required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReviewerNameView(review: review),
        SizedBox(height: MARGIN_MEDIUM),
        RatingView(rating: review?.rating?.toDouble() ?? 0),
        SizedBox(height: MARGIN_MEDIUM),
        ReviewTextView(reviewText: review?.comment ?? ""),
      ],
    );
  }
}

class ReviewTextView extends StatelessWidget {

  final String reviewText;


  ReviewTextView({required this.reviewText});

  @override
  Widget build(BuildContext context) {
    return Text(
      reviewText,
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.7),
        fontSize: TEXT_REGULAR,
      ),
    );
  }
}

class ReviewerNameView extends StatelessWidget {

  final ReviewVO? review;


  ReviewerNameView({required this.review});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          review?.name ?? "",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(0, 0, 0, 0.6),
            fontSize: TEXT_REGULAR,
          ),
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Text(
          review?.getReviewDate() ?? "",
          style: TextStyle(
            fontSize: TEXT_13,
            color: BOTTOM_SHEET_ICON_COLOR,
          ),
        ),
      ],
    );
  }
}
