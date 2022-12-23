import 'package:dotted_line/dotted_line.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/detail_item_view.dart';
import 'package:empress_ecommerce_app/widgets/order_delivery_section_view.dart';
import 'package:empress_ecommerce_app/widgets/order_payment_section_view.dart';
import 'package:empress_ecommerce_app/widgets/text_view.dart';
import 'package:flutter/material.dart';

class OrderHistoryDetailPage extends StatelessWidget {
  final OrderVO? orderVo;

  OrderHistoryDetailPage({required this.orderVo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Order Detail",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MARGIN_MEDIUM_3),
              OrderDetailListSectionView(itemList: orderVo?.orderItems ?? []),
              SizedBox(height: MARGIN_MEDIUM_3),
              DottedLineSectionView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              TotalSectionView(orderVo: orderVo),
              SizedBox(height: MARGIN_MEDIUM_3),
              DottedLineSectionView(),
              SizedBox(height: MARGIN_MEDIUM_3),
              TotalPaymentSectionView(orderVo: orderVo),
              SizedBox(height: MARGIN_XLARGE),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: OrderPaymentSectionView(
                    paymentMethod: orderVo?.paymentMethod ?? ""),
              ),
              SizedBox(height: MARGIN_XLARGE),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: OrderDeliverySectionView(
                  name: orderVo?.deliveryAddress?.fullName ?? "",
                  address: orderVo?.deliveryAddress?.address ?? "",
                ),
              ),
              SizedBox(height: MARGIN_LARGE),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalPaymentSectionView extends StatelessWidget {
  final OrderVO? orderVo;

  TotalPaymentSectionView({required this.orderVo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: PriceRowView(
        label: "Total Payment",
        price: orderVo?.totalPrice ?? 0,
        isTotalPrice: true,
      ),
    );
  }
}

class TotalSectionView extends StatelessWidget {
  final OrderVO? orderVo;

  TotalSectionView({required this.orderVo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          PriceRowView(label: "Items Price", price: orderVo?.itemsPrice ?? 0),
          SizedBox(height: MARGIN_MEDIUM),
          PriceRowView(
              label: "Delivery Fee", price: orderVo?.deliveryPrice ?? 0),
          SizedBox(height: MARGIN_MEDIUM),
          PriceRowView(label: "Tax Fee", price: orderVo?.taxPrice ?? 0),
        ],
      ),
    );
  }
}

class PriceRowView extends StatelessWidget {
  final String label;
  final double price;
  final bool isTotalPrice;

  PriceRowView(
      {required this.label, required this.price, this.isTotalPrice = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextView(
          data: "$label:",
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w600,
          color: isTotalPrice ? Colors.blue : SECONDARY_DARK_COLOR,
        ),
        TextView(
          data: "\$${price.toStringAsFixed(2)}",
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w600,
          color: isTotalPrice ? Colors.blue : SECONDARY_DARK_COLOR,
        ),
      ],
    );
  }
}

class DottedLineSectionView extends StatelessWidget {
  const DottedLineSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: DottedLine(dashColor: BORDER_COLOR, lineThickness: 2),
    );
  }
}

class OrderDetailListSectionView extends StatelessWidget {
  final List<OrderItemVO> itemList;

  OrderDetailListSectionView({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return DetailItemView(item: itemList[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: MARGIN_LARGE);
      },
    );
  }
}
