import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/text_view.dart';
import 'package:flutter/material.dart';

class DetailItemView extends StatelessWidget {
  final OrderItemVO? item;


  DetailItemView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          item?.image ?? "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=",
          width: 120,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1.2 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                data: item?.name ?? "",
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: MARGIN_MEDIUM),
              TextView(
                data: "\$${item?.price}",
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_2X,
              ),
              SizedBox(height: MARGIN_MEDIUM),
              TextView(
                data: "x${item?.quantity}",
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_2X,
                color: SECONDARY_DARK_COLOR,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
