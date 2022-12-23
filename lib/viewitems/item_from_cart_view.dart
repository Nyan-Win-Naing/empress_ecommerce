import 'package:empress_ecommerce_app/blocs/cart_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemFromCartView extends StatelessWidget {
  final ItemVO? itemVo;

  ItemFromCartView({required this.itemVo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductImageView(imageUrl: itemVo?.image ?? ""),
        ProductNameAndDetailView(itemVo: itemVo),
      ],
    );
  }
}

class ProductNameAndDetailView extends StatelessWidget {
  final ItemVO? itemVo;

  ProductNameAndDetailView({required this.itemVo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1 / 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductNameView(productName: itemVo?.name ?? ""),
          SizedBox(height: MARGIN_MEDIUM_2),
          Row(
            children: [
              IncrementDecrementView(
                operator: "-",
                onTap: () {
                  CartBloc bloc = Provider.of<CartBloc>(context, listen: false);
                  bloc.onTapMinus(itemVo);
                },
              ),
              SizedBox(width: MARGIN_MEDIUM),
              Container(
                width: 40,
                // color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    "${itemVo?.itemCount}",
                    style: TextStyle(
                      color: SECONDARY_DARK_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: MARGIN_MEDIUM),
              IncrementDecrementView(
                operator: "+",
                onTap: () {
                  CartBloc bloc = Provider.of(context, listen: false);
                  bloc.onTapAdd(itemVo);
                },
              ),
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          Row(
            children: [
              Container(
                width: 90,
                // color: Colors.blueAccent,
                child: Text(
                  "\$ ${itemVo?.price}",
                  style: TextStyle(
                    color: ORDER_BUTTON_COLOR,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  CartBloc bloc = Provider.of<CartBloc>(context, listen: false);
                  bloc.onTapDelete(itemVo);
                },
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IncrementDecrementView extends StatelessWidget {
  final String operator;
  final Function onTap;

  IncrementDecrementView({required this.operator, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (operator == "-") ? BOTTOM_SHEET_ICON_COLOR : Colors.blue,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        ),
        child: Center(
          child: Text(
            operator,
            style: TextStyle(
              fontSize: TEXT_REGULAR_3X,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductNameView extends StatelessWidget {
  final String productName;

  ProductNameView({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: TextStyle(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class ProductImageView extends StatelessWidget {
  final String imageUrl;

  ProductImageView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      (imageUrl.isNotEmpty)
          ? imageUrl
          : "https://joadre.com/wp-content/uploads/2019/02/no-image.jpg",
      width: 120,
    );
  }
}
