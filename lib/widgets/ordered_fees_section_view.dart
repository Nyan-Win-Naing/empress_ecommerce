import 'package:empress_ecommerce_app/pages/order_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:flutter/material.dart';

class OrderedFeesSectionView extends StatelessWidget {
  final double totalItemsPrice;
  final double deliveryFee;
  final double taxFee;
  final double totalPayment;

  OrderedFeesSectionView({
    required this.totalItemsPrice,
    required this.deliveryFee,
    required this.taxFee,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductListTitleView(title: "Order"),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM, vertical: MARGIN_CARD_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: BORDER_COLOR),
          ),
          child: Column(
            children: [
              LabelAndPriceView(
                  label: "Items Price:", price: "\$$totalItemsPrice"),
              SizedBox(height: MARGIN_MEDIUM_2),
              LabelAndPriceView(label: "Delivery Fee:", price: "\$$deliveryFee"),
              SizedBox(height: MARGIN_MEDIUM_2),
              LabelAndPriceView(label: "Tax Fee:", price: "\$$taxFee"),
              SizedBox(height: MARGIN_CARD_MEDIUM_2),
              Divider(
                color: BORDER_COLOR,
                thickness: 1.2,
              ),
              SizedBox(height: MARGIN_CARD_MEDIUM_2),
              LabelAndPriceView(label: "Total Price:", price: "\$${totalPayment.toStringAsFixed(2)}"),
            ],
          ),
        ),
      ],
    );
  }
}
