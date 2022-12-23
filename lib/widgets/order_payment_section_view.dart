import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:flutter/material.dart';

class OrderPaymentSectionView extends StatelessWidget {

  final String paymentMethod;


  OrderPaymentSectionView({required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductListTitleView(title: "Payment"),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM, vertical: MARGIN_CARD_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: BORDER_COLOR),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CashDown: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                (paymentMethod == "paypal") ? "Paypal" : "Stripe",
                style: TextStyle(
                  color: SECONDARY_DARK_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}