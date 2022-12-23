import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class SearchItemView extends StatelessWidget {

  final ItemVO? itemVo;


  SearchItemView({required this.itemVo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // color: Colors.blue,
      margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          ImageView(imageUrl: itemVo?.image ?? "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM="),
          SizedBox(width: MARGIN_LARGE),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  itemVo?.name ?? "",
                  maxLines: 2,
                  style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_REGULAR_2X,
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM),
                Text(
                  itemVo?.brand ?? "",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black54,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM),
                Text(
                  "\$ ${itemVo?.price}",
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black87,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final String imageUrl;


  ImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 100,
      fit: BoxFit.cover,
    );
  }
}
