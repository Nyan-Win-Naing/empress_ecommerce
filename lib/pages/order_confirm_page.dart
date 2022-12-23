import 'package:empress_ecommerce_app/blocs/order_confirm_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/widgets/order_delivery_section_view.dart';
import 'package:empress_ecommerce_app/widgets/order_payment_section_view.dart';
import 'package:empress_ecommerce_app/widgets/ordered_fees_section_view.dart';
import 'package:empress_ecommerce_app/widgets/ordered_item_section_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderConfirmPage extends StatelessWidget {
  final OrderVO? orderVo;

  OrderConfirmPage({required this.orderVo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderConfirmBloc(orderVo?.orderItems ?? []),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Order Confirm",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              navigateToNextPage(context, EmpressApp());
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
                SizedBox(height: MARGIN_LARGE),
                OrderConfirmImageSectionView(),
                SizedBox(height: MARGIN_MEDIUM_3),
                InvoiceNumberSectionView(
                  invoiceNumber: orderVo?.id ?? "",
                ),
                SizedBox(height: MARGIN_XLARGE),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: OrderedFeesSectionView(
                    totalItemsPrice: orderVo?.itemsPrice ?? 0,
                    deliveryFee: orderVo?.deliveryPrice ?? 0,
                    taxFee: orderVo?.taxPrice ?? 0,
                    totalPayment: orderVo?.totalPrice ?? 0,
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM_2),
                Selector<OrderConfirmBloc, List<ItemVO>>(
                  selector: (context, bloc) => bloc.mItemList ?? [],
                  builder: (context, itemList, child) => Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: OrderedItemsSectionView(cartItems: itemList),
                  ),
                ),
                SizedBox(height: MARGIN_LARGE),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: OrderPaymentSectionView(
                      paymentMethod: orderVo?.paymentMethod ?? ""),
                ),
                SizedBox(height: MARGIN_LARGE),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: OrderDeliverySectionView(
                    name: orderVo?.deliveryAddress?.fullName ?? "",
                    address: orderVo?.deliveryAddress?.address ?? "",
                  ),
                ),
                SizedBox(height: MARGIN_LARGE),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: PurchaseSectionView(),
                ),
                SizedBox(height: MARGIN_XLARGE),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PurchaseSectionView extends StatelessWidget {
  const PurchaseSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PurchaseButtonView(label: "", image: "assets/paypal.png"),
        SizedBox(height: MARGIN_MEDIUM_2),
        PurchaseButtonView(
            label: "Pay Later", image: "assets/paypal_logo_trans.png"),
        SizedBox(height: MARGIN_MEDIUM_2),
        PurchaseButtonView(
          label: "Debit or Credit Card",
          image: "assets/wallet_white.png",
          isCreditCard: true,
        ),
      ],
    );
  }
}

class PurchaseButtonView extends StatelessWidget {
  final String label;
  final String image;
  final bool isCreditCard;

  PurchaseButtonView({
    required this.label,
    required this.image,
    this.isCreditCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      highlightElevation: 0,
      onPressed: () {},
      minWidth: double.infinity,
      height: MARGIN_XXLARGE,
      color: isCreditCard
          ? DEBIT_BUTTON_BACKGROUND_COLOR
          : PAYPAL_BUTTON_BACKGROUND_COLOR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: label.isEmpty ? 30 : 25,
          ),
          Visibility(
            visible: label.isNotEmpty,
            child: SizedBox(width: MARGIN_MEDIUM_2),
          ),
          Visibility(
            visible: label.isNotEmpty,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: TEXT_REGULAR_2X,
                color: isCreditCard ? Colors.white : SECONDARY_DARK_COLOR,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvoiceNumberSectionView extends StatelessWidget {
  final String invoiceNumber;

  InvoiceNumberSectionView({required this.invoiceNumber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Text(
        "Invoice Number: $invoiceNumber",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: TEXT_REGULAR_2X,
          height: 1.3,
        ),
      ),
    );
  }
}

class OrderConfirmImageSectionView extends StatelessWidget {
  const OrderConfirmImageSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/order_confirm.png",
        width: MediaQuery.of(context).size.width * 2.5 / 3,
      ),
    );
  }
}
