import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/text_view.dart';
import 'package:flutter/material.dart';

class DetailItemView extends StatelessWidget {
  const DetailItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.network(
          "https://res.cloudinary.com/dqscrfky2/image/upload/v1666593361/u5vmwuhm00kagvkarmme.png",
          width: 120,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 1.2 / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextView(
                data: "Logitech G240",
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: MARGIN_MEDIUM),
              TextView(
                data: "\$19.99",
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_2X,
              ),
              SizedBox(height: MARGIN_MEDIUM),
              TextView(
                data: "x3",
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
