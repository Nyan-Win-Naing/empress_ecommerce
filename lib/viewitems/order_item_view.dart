import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          "https://res.cloudinary.com/dqscrfky2/image/upload/v1666455051/auodcxmsfaf3scpkdblk.png",
          width: 100,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1.2 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Razer Mouse",
                style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MARGIN_SMALL),
              Text(
                "Total: 5",
                style: TextStyle(
                  color: SECONDARY_DARK_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MARGIN_SMALL),
              Text(
                "\$ 19.87",
                style: TextStyle(
                  color: SECONDARY_DARK_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
