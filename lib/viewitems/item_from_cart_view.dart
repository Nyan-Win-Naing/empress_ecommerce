import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ItemFromCartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageView(),
        ProductNameAndDetailView(),
      ],
    );
  }
}

class ProductNameAndDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameView(),
          SizedBox(height: MARGIN_MEDIUM_2),
          Row(
            children: [
              IncrementDecrementView(operator: "-"),
              SizedBox(width: MARGIN_MEDIUM),
              Container(
                width: 40,
                // color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    "3",
                    style: TextStyle(
                      color: SECONDARY_DARK_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: MARGIN_MEDIUM),
              IncrementDecrementView(operator: "+"),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          Row(
            children: [
              Container(
                width: 90,
                // color: Colors.blueAccent,
                child: Text(
                  "\$ 19.87",
                  style: TextStyle(
                    color: ORDER_BUTTON_COLOR,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                Icons.delete_forever,
                color: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IncrementDecrementView extends StatelessWidget {
  final String operator;

  IncrementDecrementView({required this.operator});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: (operator == "-") ? BOTTOM_SHEET_ICON_COLOR : Colors.blue,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: Center(
        child: Text(
          operator,
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class ProductNameView extends StatelessWidget {
  const ProductNameView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Razer Mouse",
      style: TextStyle(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://res.cloudinary.com/dqscrfky2/image/upload/v1666455051/auodcxmsfaf3scpkdblk.png",
      width: 120,
    );
  }
}
