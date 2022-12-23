import 'package:dotted_line/dotted_line.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class OrderHistoryView extends StatelessWidget {

  final OrderVO? orderVo;


  OrderHistoryView({required this.orderVo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MARGIN_CARD_MEDIUM_2,
        vertical: MARGIN_CARD_MEDIUM_2,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
        border: Border.all(color: BORDER_COLOR),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateView(date: orderVo?.getFormattedDate() ?? ""),
          SizedBox(height: MARGIN_MEDIUM_2),
          OrderHistoryTitleView(),
          SizedBox(height: MARGIN_MEDIUM_3),
          OrderedItemListView(itemList: orderVo?.orderItems ?? []),
          SizedBox(height: MARGIN_MEDIUM_2),
          DottedDivider(),
          SizedBox(height: MARGIN_MEDIUM_2),
          PaymentSectionView(orderVo: orderVo),
        ],
      ),
    );
  }
}

class DateView extends StatelessWidget {

  final String date;


  DateView({required this.date});

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: TEXT_REGULAR_2X,
        color: Colors.blue,
      ),
    );
  }
}

class PaymentSectionView extends StatelessWidget {

  final OrderVO? orderVo;


  PaymentSectionView({required this.orderVo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PriceView(label: "Delivery Fee", price: orderVo?.deliveryPrice ?? 0),
        SizedBox(height: MARGIN_MEDIUM),
        PriceView(label: "Tax Fee", price: orderVo?.taxPrice ?? 0),
        SizedBox(height: MARGIN_MEDIUM),
        PriceView(label: "Total Payment", price: orderVo?.totalPrice ?? 0, isTotalPayment: true),
      ],
    );
  }
}

class PriceView extends StatelessWidget {
  final String label;
  final double price;
  final bool isTotalPayment;

  PriceView(
      {required this.label, required this.price, this.isTotalPayment = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label:",
          style: TextStyle(
            color: isTotalPayment ? ORDER_BUTTON_COLOR : SECONDARY_DARK_COLOR,
            fontSize: TEXT_15,
            fontWeight: isTotalPayment ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
        Text(
          "\$ ${price.toStringAsFixed(2)}",
          style: TextStyle(
            color: isTotalPayment ? ORDER_BUTTON_COLOR : SECONDARY_DARK_COLOR,
            fontWeight: isTotalPayment ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedLine(
      dashColor: BORDER_COLOR,
    );
  }
}

class OrderedItemListView extends StatelessWidget {

  final List<OrderItemVO> itemList;


  OrderedItemListView({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return EachOrderItemView(orderItemVo: itemList[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: MARGIN_MEDIUM_2);
      },
    );
  }
}

class EachOrderItemView extends StatelessWidget {
  final OrderItemVO? orderItemVo;


  EachOrderItemView({required this.orderItemVo});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemColumnView(title: orderItemVo?.name ?? "", width: 1),
        SizedBox(width: MARGIN_SMALL),
        ItemColumnView(title: "${orderItemVo?.quantity}x", width: 0.5, isQty: true),
        SizedBox(width: MARGIN_SMALL),
        ItemColumnView(title: "\$ ${orderItemVo?.getItemPrice()}", width: 0.8, isPrice: true),
      ],
    );
  }
}

class OrderHistoryTitleView extends StatelessWidget {
  const OrderHistoryTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ItemColumnTitleView(title: "Items", width: 1),
        SizedBox(width: MARGIN_SMALL),
        ItemColumnTitleView(title: "Qty", width: 0.5, isQty: true),
        SizedBox(width: MARGIN_SMALL),
        ItemColumnTitleView(title: "Price", width: 0.8, isPrice: true),
      ],
    );
  }
}

class ItemColumnTitleView extends StatelessWidget {
  final String title;
  final double width;
  final bool isQty;
  final bool isPrice;

  ItemColumnTitleView({
    required this.title,
    required this.width,
    this.isQty = false,
    this.isPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width / 3,
      // color: Colors.blue,
      child: Text(
        title,
        textAlign: isPrice
            ? TextAlign.right
            : isQty
                ? TextAlign.center
                : TextAlign.left,
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ItemColumnView extends StatelessWidget {
  final String title;
  final double width;
  final bool isQty;
  final bool isPrice;

  ItemColumnView({
    required this.title,
    required this.width,
    this.isQty = false,
    this.isPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width / 3,
      // color: Colors.blue,
      child: Text(
        title,
        textAlign: isPrice
            ? TextAlign.right
            : isQty
                ? TextAlign.center
                : TextAlign.left,
        style: TextStyle(
          color: SECONDARY_DARK_COLOR,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
