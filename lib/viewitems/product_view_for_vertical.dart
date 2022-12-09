import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductViewForVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // color: Colors.blue,
      margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 2.3 / 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://res.cloudinary.com/dqscrfky2/image/upload/v1666593361/u5vmwuhm00kagvkarmme.png",
                  width: 100,
                ),
                SizedBox(width: MARGIN_MEDIUM_2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Logitech G240",
                      style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        color: SECONDARY_DARK_COLOR,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: MARGIN_MEDIUM),
                    Text(
                      "Logitech G",
                    ),
                    SizedBox(height: MARGIN_MEDIUM),
                    Text(
                      "\$ 9.99",
                      style: TextStyle(
                        color: SECONDARY_DARK_COLOR,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.more_horiz,
            color: SECONDARY_DARK_COLOR,
          ),
        ],
      ),
    );
  }
}
