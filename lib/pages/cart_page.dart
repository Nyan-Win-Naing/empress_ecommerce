import 'package:empress_ecommerce_app/pages/order_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/item_from_cart_view.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MARGIN_MEDIUM_3),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return ItemFromCartView();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: MARGIN_LARGE),
                        child: Divider(
                          color: BORDER_COLOR,
                          thickness: 1.2,
                        ),
                      );
                    },
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
                    TotalRowView(label: "Total Items:", value: "7"),
                    SizedBox(height: MARGIN_MEDIUM_2),
                    TotalRowView(label: "Total Payment:", value: "\$ 729.35"),
                    SizedBox(height: MARGIN_MEDIUM),
                    CheckoutButtonView(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
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
