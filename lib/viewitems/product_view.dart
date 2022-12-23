import 'package:empress_ecommerce_app/blocs/home_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/pages/product_detail_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/utils/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            ProductImageView(
              image: item?.image ??
                  "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=",
              onTap: () {
                HomeBloc bloc = Provider.of<HomeBloc>(context, listen: false);
                showProductBottomSheet(context, item, bloc);
              },
            ),
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

  void showProductBottomSheet(BuildContext context, ItemVO? itemVo, HomeBloc bloc) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: MARGIN_CARD_MEDIUM_2),
              child: HeaderSectionBottomSheet(itemVo: itemVo),
            ),
            Divider(
              color: Color.fromRGBO(0, 0, 0, 0.2),
            ),
            BottomSheetListTileView(
              iconData: Icons.info_outline,
              title: "View Detail",
              onTap: () {
                Navigator.pop(context);
                navigateToNextPage(context, ProductDetailPage(itemId: itemVo?.id ?? ""));
              },
            ),
            BottomSheetListTileView(
              iconData: Icons.add_shopping_cart,
              title: "Add To Cart",
              onTap: () {
                bloc.onTapAddToCart(itemVo).then((value) {
                  Navigator.pop(context);
                  showSnackBarWithMessage(context, "Added to cart!");
                });
              },
            ),
          ],
        );
      },
    );
  }
}

class ProductImageView extends StatelessWidget {
  final String image;
  final Function onTap;

  ProductImageView({required this.image, required this.onTap});

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
                  onTap();
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
}

class BottomSheetListTileView extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onTap;

  BottomSheetListTileView(
      {required this.iconData, required this.title, required this.onTap});

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
      onTap: () {
        onTap();
      },
    );
  }
}

class HeaderSectionBottomSheet extends StatelessWidget {
  final ItemVO? itemVo;

  HeaderSectionBottomSheet({required this.itemVo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM),
          child: Image.network(
            itemVo?.image ??
                "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=",
            width: 80,
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemVo?.name ?? "",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              itemVo?.brand ?? "",
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "\$ ${itemVo?.price}",
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
