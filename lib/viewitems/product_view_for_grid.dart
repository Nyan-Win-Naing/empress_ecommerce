import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductViewForGrid extends StatelessWidget {

  final bool is3xGrid;


  ProductViewForGrid({this.is3xGrid = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2, bottom: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: is3xGrid ? 110 : 155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: BORDER_COLOR),
                ),
                child: Image.network(
                  "https://res.cloudinary.com/dqscrfky2/image/upload/v1666593361/u5vmwuhm00kagvkarmme.png",
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    is3xGrid ? Icons.more_vert : Icons.more_horiz,
                    size: MARGIN_MEDIUM_3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            "Logitech G240",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: is3xGrid ? TEXT_13 : TEXT_REGULAR,
              color: SECONDARY_DARK_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "Logitech G",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: TEXT_13,
            ),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "\$ 9.99",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: TEXT_13,
              color: SECONDARY_DARK_COLOR,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
