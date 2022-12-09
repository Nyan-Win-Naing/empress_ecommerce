import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class AddToCartButtonView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      elevation: 0,
      onPressed: () {},
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
