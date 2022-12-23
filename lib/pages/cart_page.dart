import 'package:empress_ecommerce_app/blocs/cart_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/pages/order_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/viewitems/item_from_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM),
            child: GestureDetector(
              onTap: () {
                navigateToNextPage(context, EmpressApp(specificTab: 1));
              },
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: MARGIN_MEDIUM_3,
                  ),
                  Text(
                    "Shopping",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: MARGIN_MEDIUM_3),
                    Selector<CartBloc, List<ItemVO>>(
                      selector: (context, bloc) => bloc.itemList ?? [],
                      shouldRebuild: (previous, next) => previous != next,
                      builder: (context, itemList, child) => itemList.isNotEmpty
                          ? ListView.separated(
                              padding: EdgeInsets.symmetric(
                                  horizontal: MARGIN_MEDIUM_2),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: itemList.length,
                              itemBuilder: (context, index) {
                                return ItemFromCartView(
                                    itemVo: itemList[index]);
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: MARGIN_LARGE),
                                  child: Divider(
                                    color: BORDER_COLOR,
                                    thickness: 1.2,
                                  ),
                                );
                              },
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                  top: MARGIN_XXLARGE * 3),
                              child: Center(
                                child: Text(
                                  "There is no item in cart!",
                                  style: TextStyle(
                                    color: BOTTOM_SHEET_ICON_COLOR,
                                    fontSize: TEXT_REGULAR_2X,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: MARGIN_XLARGE * 6),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(
                      left: MARGIN_MEDIUM_2,
                      right: MARGIN_MEDIUM_2,
                      top: MARGIN_LARGE,
                      bottom: MARGIN_MEDIUM_2),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MARGIN_LARGE),
                      topRight: Radius.circular(MARGIN_LARGE),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Selector<CartBloc, int>(
                        selector: (context, bloc) => bloc.totalItemCount,
                        builder: (context, totalItemCount, child) =>
                            TotalRowView(
                          label: "Total Items:",
                          value: totalItemCount.toString(),
                        ),
                      ),
                      SizedBox(height: MARGIN_MEDIUM_2),
                      Selector<CartBloc, double>(
                        selector: (context, bloc) => bloc.totalAmount,
                        builder: (context, totalPayment, child) => TotalRowView(
                          label: "Total Payment:",
                          value: "\$ ${totalPayment.toStringAsFixed(2)}",
                        ),
                      ),
                      SizedBox(height: MARGIN_MEDIUM),
                      Builder(builder: (context) {
                        return CheckoutButtonView(
                          onTap: () {
                            CartBloc bloc =
                                Provider.of<CartBloc>(context, listen: false);
                            print(
                                "Item List: ${bloc.itemList}, Total Item Count: ${bloc.totalItemCount}, Total Payment Amount: ${bloc.totalAmount}");
                            if(bloc.itemList != null && (bloc.itemList?.isNotEmpty ?? false)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderPage(
                                    cartItems: bloc.itemList ?? [],
                                    totalAmount: bloc.totalAmount,
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutButtonView extends StatelessWidget {
  final Function onTap;

  CheckoutButtonView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          elevation: 0,
          highlightElevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(MARGIN_MEDIUM),
          ),
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
          color: Colors.white,
          onPressed: () {
            onTap();
          },
          child: Text(
            "Checkout",
            style: TextStyle(
              color: Colors.blue,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class TotalRowView extends StatelessWidget {
  final String label;
  final String value;

  TotalRowView({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
      ],
    );
  }
}
