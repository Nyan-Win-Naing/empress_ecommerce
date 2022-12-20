import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/pages/product_detail_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {

  final ItemVO? item;


  ProductView({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(itemId: item?.id ?? ""),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: MARGIN_MEDIUM),
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageView(image: item?.image ?? "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM="),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              item?.name ?? "",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              item?.brand ?? "",
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "\$ ${item?.price}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImageView extends StatelessWidget {

  final String image;


  ProductImageView({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: BORDER_COLOR),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              image,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  EdgeInsets.only(top: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
              child: GestureDetector(
                onTap: () {
                  showProductBottomSheet(context);
                },
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showProductBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: MARGIN_CARD_MEDIUM_2),
              child: HeaderSectionBottomSheet(),
            ),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            BottomSheetListTileView(
                iconData: Icons.info_outline, title: "View Detail"),
            BottomSheetListTileView(
                iconData: Icons.add_shopping_cart, title: "Add To Cart"),
          ],
        );
      },
    );
  }
}

class BottomSheetListTileView extends StatelessWidget {
  final IconData iconData;
  final String title;

  BottomSheetListTileView({required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Colors.black,
      ),
      title: Transform.translate(
        offset: Offset(-16, 0),
        child: Text(
          title,
          style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

class HeaderSectionBottomSheet extends StatelessWidget {
  const HeaderSectionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM),
          child: Image.network(
            "https://res.cloudinary.com/dqscrfky2/image/upload/v1666593361/u5vmwuhm00kagvkarmme.png",
            width: 80,
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Logitech G240",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "Logitech G",
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "\$ 9.99",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: TEXT_REGULAR_2X,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
