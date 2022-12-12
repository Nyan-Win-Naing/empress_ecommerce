import 'package:empress_ecommerce_app/pages/order_confirm_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/order_item_view.dart';
import 'package:empress_ecommerce_app/widgets/label_and_text_field_view.dart';
import 'package:empress_ecommerce_app/widgets/order_delivery_section_view.dart';
import 'package:empress_ecommerce_app/widgets/order_payment_section_view.dart';
import 'package:empress_ecommerce_app/widgets/ordered_fees_section_view.dart';
import 'package:empress_ecommerce_app/widgets/ordered_item_section_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:empress_ecommerce_app/widgets/title_view_with_see_all.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          getTitle(),
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
        child: Stepper(
          elevation: 0,
          type: StepperType.horizontal,
          // onStepContinue: () {
          //   onTapContinue();
          // },
          // onStepCancel: () {
          //   onTapCancel();
          // },
          controlsBuilder: (context, controlDetails) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
              child: Row(
                children: [
                  StepperButtonView(
                    onTap: () {
                      onTapContinue();
                    },
                    label: (_currentStep != 2) ? "Next" : "Confirm Order",
                  ),
                  SizedBox(width: MARGIN_MEDIUM_2),
                  StepperButtonView(
                    onTap: () {
                      onTapCancel();
                    },
                    label: "Back",
                    isContinue: false,
                  ),
                ],
              ),
            );
          },
          physics: AlwaysScrollableScrollPhysics(),
          currentStep: _currentStep,
          steps: [
            Step(
              title: Text(
                "Delivery",
              ),
              content: DeliveryAddressSectionView(),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text(
                "Payment",
              ),
              content: PaymentSectionView(),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: Text(
                "Order",
              ),
              content: OrderSectionView(),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }

  String getTitle() {
    if (_currentStep == 0) {
      return "Delivery";
    } else if (_currentStep == 1) {
      return "Choose Payment";
    } else {
      return "Order";
    }
  }

  void onTapCancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void onTapContinue() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderConfirmPage(),
        ),
      );
    }
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
        OrderedFeesSectionView(),
        SizedBox(height: MARGIN_MEDIUM_2),
        OrderedItemsSectionView(),
        SizedBox(height: MARGIN_MEDIUM_2),
        OrderPaymentSectionView(),
        SizedBox(height: MARGIN_MEDIUM_2),
        OrderDeliverySectionView(),
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
  String payment = "paypal";

  @override
  Widget build(BuildContext context) {
    return Column(
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
          groupValue: payment,
          onChanged: (value) {
            setState(() {
              payment = value ?? "";
            });
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
          groupValue: payment,
          onChanged: (value) {
            setState(() {
              payment = value ?? "";
            });
          },
        ),
      ],
    );
  }
}

class DeliveryAddressSectionView extends StatelessWidget {
  const DeliveryAddressSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelAndTextFieldView(
          label: "Full Name",
          hintText: "Enter your full name",
          onChanged: (value) {},
        ),
        SizedBox(height: MARGIN_LARGE),
        LabelAndTextFieldView(
          label: "State",
          hintText: "Enter your living state",
          onChanged: (value) {},
        ),
        SizedBox(height: MARGIN_LARGE),
        LabelAndTextFieldView(
          label: "City",
          hintText: "Enter city",
          onChanged: (value) {},
        ),
        SizedBox(height: MARGIN_LARGE),
        LabelAndTextFieldView(
          label: "Address",
          hintText: "Enter your full address",
          onChanged: (value) {},
        ),
      ],
    );
  }
}
