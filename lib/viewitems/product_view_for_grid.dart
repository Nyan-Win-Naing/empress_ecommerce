import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductViewForGrid extends StatelessWidget {

  final bool is3xGrid;
  final ItemVO? item;


  ProductViewForGrid({this.is3xGrid = true, required this.item});

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
                  item?.image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png",
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
            item?.name ?? "",
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
            item?.brand ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: TEXT_13,
            ),
          ),
          SizedBox(height: MARGIN_SMALL),
          Text(
            "\$ ${item?.price ?? 0}",
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
