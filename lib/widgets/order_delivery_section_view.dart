import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:flutter/material.dart';

class OrderDeliverySectionView extends StatelessWidget {

  final String name;
  final String address;


  OrderDeliverySectionView({required this.name, required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductListTitleView(title: "Delivery"),
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
              AddressRowView(label: "Name:", value: name),
              SizedBox(height: MARGIN_MEDIUM_2),
              AddressRowView(
                  label: "Address:",
                  value: address),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressRowView extends StatelessWidget {
  final String label;
  final String value;

  AddressRowView({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 1.2 / 3,
          child: Text(
            value,
            style: TextStyle(
              color: SECONDARY_DARK_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}