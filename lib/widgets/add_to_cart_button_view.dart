import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class AddToCartButtonView extends StatelessWidget {

  final Function onTap;


  AddToCartButtonView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      elevation: 0,
      onPressed: () {
        onTap();
      },
      child: Row(
        children: [
          Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: MARGIN_MEDIUM_3,
          ),
          SizedBox(width: MARGIN_SMALL),
          Text(
            "Add to cart",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
