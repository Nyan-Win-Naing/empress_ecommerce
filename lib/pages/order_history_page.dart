import 'package:empress_ecommerce_app/blocs/order_history_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:empress_ecommerce_app/pages/order_history_detail_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/viewitems/order_history_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderHistoryBloc(),
      child: Scaffold(
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
        body: Selector<OrderHistoryBloc, List<OrderVO>>(
          selector: (context, bloc) => bloc.mOrderList ?? [],
          builder: (context, orderList, child) => Container(
            child: orderList.isNotEmpty ? ListView.separated(
              padding: EdgeInsets.only(
                left: MARGIN_MEDIUM,
                right: MARGIN_MEDIUM,
                top: MARGIN_LARGE,
                bottom: MARGIN_LARGE,
              ),
              itemCount: orderList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    navigateToNextPage(context, OrderHistoryDetailPage(orderVo: orderList[index]));
                  },
                  child: OrderHistoryView(orderVo: orderList[index]),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: MARGIN_MEDIUM_2);
              },
            ) : Center(
              child: Text(
                "There is no order history.",
                style: TextStyle(
                    color: BOTTOM_SHEET_ICON_COLOR,
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_REGULAR_2X),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
