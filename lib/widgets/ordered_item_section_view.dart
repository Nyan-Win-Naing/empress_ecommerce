import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/order_item_view.dart';
import 'package:empress_ecommerce_app/widgets/title_view_with_see_all.dart';
import 'package:flutter/material.dart';

class OrderedItemsSectionView extends StatefulWidget {
  const OrderedItemsSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderedItemsSectionView> createState() =>
      _OrderedItemsSectionViewState();
}

class _OrderedItemsSectionViewState extends State<OrderedItemsSectionView> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleViewWithSeeAll(
          title: "Items",
          label: isHide ? "Show" : "Hide",
          onTap: () {
            setState(() {
              isHide = !isHide;
            });
          },
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Visibility(
          visible: !isHide,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM, vertical: MARGIN_CARD_MEDIUM_2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              border: Border.all(color: BORDER_COLOR),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return OrderItemView();
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: MARGIN_MEDIUM_3);
              },
            ),
          ),
        )
      ],
    );
  }
}
