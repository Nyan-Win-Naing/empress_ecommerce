import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class OrderItemView extends StatelessWidget {

  final ItemVO? itemVo;


  OrderItemView({required this.itemVo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          itemVo?.image ?? "https://joadre.com/wp-content/uploads/2019/02/no-image.jpg",
          width: 100,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1.2 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemVo?.name ?? "",
                style: TextStyle(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MARGIN_SMALL),
              Text(
                "Total: ${itemVo?.itemCount}",
                style: TextStyle(
                  color: SECONDARY_DARK_COLOR,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: MARGIN_SMALL),
              Text(
                "\$ ${itemVo?.price}",
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
