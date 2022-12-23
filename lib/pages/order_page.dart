import 'package:empress_ecommerce_app/blocs/order_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/pages/order_confirm_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/viewitems/order_item_view.dart';
import 'package:empress_ecommerce_app/widgets/label_and_text_field_view.dart';
import 'package:empress_ecommerce_app/widgets/order_delivery_section_view.dart';
import 'package:empress_ecommerce_app/widgets/order_payment_section_view.dart';
import 'package:empress_ecommerce_app/widgets/ordered_fees_section_view.dart';
import 'package:empress_ecommerce_app/widgets/ordered_item_section_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:empress_ecommerce_app/widgets/title_view_with_see_all.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  final List<ItemVO> cartItems;
  final double totalAmount;

  OrderPage({required this.cartItems, required this.totalAmount});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OrderBloc(widget.cartItems, widget.totalAmount),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Selector<OrderBloc, int>(
            selector: (context, bloc) => bloc.currentStep,
            builder: (context, currentStep, child) => Text(
              getTitle(currentStep),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
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
          child: Selector<OrderBloc, int>(
            selector: (context, bloc) => bloc.currentStep,
            builder: (context, currentStep, child) => Stepper(
              elevation: 0,
              type: StepperType.horizontal,
              controlsBuilder: (context, controlDetails) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
                  child: Row(
                    children: [
                      StepperButtonView(
                        onTap: () {
                          OrderBloc bloc = Provider.of(context, listen: false);
                          bloc.onTapContinue();
                          if (bloc.isFormError) {
                            showAlertDialog(context);
                          }
                          if(currentStep == 2) {
                            bloc.onTapConfirmOrder().then((order) {
                              navigateToNextPage(context, OrderConfirmPage(orderVo: order));
                            });
                          }
                        },
                        label: (currentStep != 2) ? "Next" : "Confirm Order",
                      ),
                      SizedBox(width: MARGIN_MEDIUM_2),
                      StepperButtonView(
                        onTap: () {
                          OrderBloc bloc = Provider.of(context, listen: false);
                          bloc.onTapCancel();
                        },
                        label: "Back",
                        isContinue: false,
                      ),
                    ],
                  ),
                );
              },
              physics: AlwaysScrollableScrollPhysics(),
              currentStep: currentStep,
              steps: [
                Step(
                  title: Text(
                    "Delivery",
                  ),
                  content: DeliveryAddressSectionView(),
                  isActive: currentStep >= 0,
                  state: currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text(
                    "Payment",
                  ),
                  content: PaymentSectionView(),
                  isActive: currentStep >= 0,
                  state: currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: Text(
                    "Order",
                  ),
                  content: OrderSectionView(),
                  isActive: currentStep >= 0,
                  state: currentStep >= 2
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getTitle(int currentStep) {
    if (currentStep == 0) {
      return "Delivery";
    } else if (currentStep == 1) {
      return "Choose Payment";
    } else {
      return "Order";
    }
  }

  void showAlertDialog(BuildContext context) {
    /// Set up the button
    Widget okButton = TextButton(
      style: TextButton.styleFrom(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.6)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "OK",
        style: TextStyle(
          color: SECONDARY_DARK_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: TEXT_REGULAR_2X,
        ),
      ),
    );

    /// Set Up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM_2))),
      backgroundColor: ALERT_DIALOG_BACKGROUND_COLOR,
      title: Text(
        "Alert",
        style: TextStyle(color: Colors.white),
      ),
      content: Text(
        "All fields must be filled for delivery!",
        style: TextStyle(
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w500,
          color: ALERT_DIALOG_TEXT_COLOR,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class StepperButtonView extends StatelessWidget {
  final Function onTap;
  final String label;
  final bool isContinue;

  StepperButtonView(
      {required this.onTap, required this.label, this.isContinue = true});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: isContinue ? Colors.blue : BORDER_COLOR,
      onPressed: () {
        onTap();
      },
      elevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: TEXT_REGULAR_2X,
          color: isContinue ? Colors.white : SECONDARY_DARK_COLOR,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class OrderSectionView extends StatelessWidget {
  const OrderSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<OrderBloc>(
          builder: (context, bloc, child) => OrderedFeesSectionView(
            totalItemsPrice: bloc.totalPrice,
            deliveryFee: bloc.deliveryFee,
            taxFee: bloc.taxFee,
            totalPayment: bloc.totalPayment,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Selector<OrderBloc, List<ItemVO>>(
          selector: (context, bloc) => bloc.cartItems,
          builder: (context, cartItems, child) =>
              OrderedItemsSectionView(cartItems: cartItems),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Selector<OrderBloc, String>(
          selector: (context, bloc) => bloc.paymentMethod,
          builder: (context, paymentMethod, child) =>
              OrderPaymentSectionView(paymentMethod: paymentMethod),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Consumer<OrderBloc>(
          builder: (context, bloc, child) => OrderDeliverySectionView(
            name: bloc.fullName,
            address: bloc.address,
          ),
        ),
      ],
    );
  }
}

class LabelAndPriceView extends StatelessWidget {
  final String label;
  final String price;

  LabelAndPriceView({required this.label, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: SECONDARY_DARK_COLOR,
          ),
        ),
        Text(
          price,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: SECONDARY_DARK_COLOR,
          ),
        ),
      ],
    );
  }
}

class PaymentSectionView extends StatefulWidget {
  @override
  State<PaymentSectionView> createState() => _PaymentSectionViewState();
}

class _PaymentSectionViewState extends State<PaymentSectionView> {
  // String payment = "paypal";

  @override
  Widget build(BuildContext context) {
    return Selector<OrderBloc, String>(
      selector: (context, bloc) => bloc.paymentMethod,
      builder: (context, paymentMethod, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Choose your payment",
            style: TextStyle(
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          RadioListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/paypal_logo_trans.png",
                  width: 30,
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text("Paypal"),
              ],
            ),
            value: "paypal",
            groupValue: paymentMethod,
            onChanged: (value) {
              OrderBloc bloc = Provider.of<OrderBloc>(context, listen: false);
              bloc.onChoosePaymentMethod(value ?? "");
            },
          ),
          RadioListTile(
            title: Row(
              children: [
                Image.asset(
                  "assets/stripe_logo.png",
                  width: 30,
                ),
                SizedBox(width: MARGIN_MEDIUM),
                Text("Stripe"),
              ],
            ),
            value: "stripe",
            groupValue: paymentMethod,
            onChanged: (value) {
              OrderBloc bloc = Provider.of<OrderBloc>(context, listen: false);
              bloc.onChoosePaymentMethod(value ?? "");
            },
          ),
        ],
      ),
    );
  }
}

class DeliveryAddressSectionView extends StatelessWidget {
  const DeliveryAddressSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderBloc>(
      builder: (context, bloc, child) => Column(
        children: [
          LabelAndTextFieldView(
            label: "Full Name",
            hintText: "Enter your full name",
            onChanged: (fullName) {
              OrderBloc bloc = Provider.of<OrderBloc>(context, listen: false);
              bloc.onChangedFullName(fullName);
            },
            textEditingController: TextEditingController(text: bloc.fullName),
          ),
          SizedBox(height: MARGIN_LARGE),
          LabelAndTextFieldView(
            label: "State",
            hintText: "Enter your living state",
            onChanged: (state) {
              OrderBloc bloc = Provider.of<OrderBloc>(context, listen: false);
              bloc.onChangedState(state);
            },
            textEditingController: TextEditingController(text: bloc.state),
          ),
          SizedBox(height: MARGIN_LARGE),
          LabelAndTextFieldView(
            label: "City",
            hintText: "Enter city",
            onChanged: (city) {
              OrderBloc bloc = Provider.of<OrderBloc>(context, listen: false);
              bloc.onChangedCity(city);
            },
            textEditingController: TextEditingController(text: bloc.city),
          ),
          SizedBox(height: MARGIN_LARGE),
          LabelAndTextFieldView(
            label: "Address",
            hintText: "Enter your full address",
            onChanged: (address) {
              OrderBloc bloc = Provider.of<OrderBloc>(context, listen: false);
              bloc.onChangedAddress(address);
            },
            textEditingController: TextEditingController(text: bloc.address),
          ),
        ],
      ),
    );
  }
}
