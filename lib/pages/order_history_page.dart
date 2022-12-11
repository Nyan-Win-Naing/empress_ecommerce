import 'package:empress_ecommerce_app/pages/order_history_detail_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/order_history_view.dart';
import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Order History",
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
      body: ListView.separated(
        padding: EdgeInsets.only(
          left: MARGIN_MEDIUM,
          right: MARGIN_MEDIUM,
          top: MARGIN_LARGE,
          bottom: MARGIN_LARGE,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _navigateToOrderHistoryDetailPage(context);
            },
            child: OrderHistoryView(),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: MARGIN_MEDIUM_2);
        },
      ),
    );
  }

  void _navigateToOrderHistoryDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderHistoryDetailPage(),
      ),
    );
  }
}
