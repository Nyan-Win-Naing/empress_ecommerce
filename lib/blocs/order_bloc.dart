import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/models/item_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/delivery_address_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:flutter/foundation.dart';

class OrderBloc extends ChangeNotifier {
  /// States
  List<ItemVO> cartItems = [];
  double totalPrice = 0;
  double deliveryFee = 0;
  double taxFee = 0;
  double totalPayment = 0;

  bool _disposed = false;
  int currentStep = 0;
  String fullName = "";
  String state = "";
  String city = "";
  String address = "";
  bool isFormError = false;
  String paymentMethod = "paypal";

  /// Model
  ItemModel mItemModel = ItemModelImpl();

  OrderBloc(List<ItemVO> cartItems, double totalPrice) {
    this.cartItems = cartItems;
    notifyListeners();
    this.totalPrice = totalPrice;
    notifyListeners();

    deliveryFee = totalPrice > 3000 ? 0 : 2.5;
    taxFee = double.parse((0.002 * totalPrice).toStringAsFixed(2));
    totalPayment = totalPrice + deliveryFee + taxFee;
    notifyListeners();
  }

  void onTapCancel() {
    if (currentStep > 0) {
      currentStep -= 1;
      notifyListeners();
    }
  }

  void onTapContinue() {
    if (currentStep < 2) {
      if (currentStep == 0) {
        _checkDeliveryFields();
        if (!isFormError) {
          currentStep += 1;
          notifyListeners();
        }
      } else {
        currentStep += 1;
        notifyListeners();
      }
    }
  }

  Future<OrderVO?> onTapConfirmOrder() {
    DeliveryAddressVO deliveryAddressVo = DeliveryAddressVO(
      fullName: fullName,
      address: address,
      city: city,
      addressState: state,
    );

    List<OrderItemVO> orderItemList = cartItems.map((itemVo) {
      return OrderItemVO(
        name: itemVo.name,
        price: itemVo.price,
        quantity: itemVo.itemCount,
        image: itemVo.image,
        item: itemVo.id,
        id: itemVo.id,
      );
    }).toList();


    // print("$deliveryAddressVo\n$orderItemList\n$paymentMethod\n$totalPrice\n$deliveryFee\n$taxFee\n$totalPayment");
    return mItemModel.confirmOrder(
      deliveryAddress: deliveryAddressVo,
      orderItemList: orderItemList,
      paymentMethod: paymentMethod,
      itemsPrice: totalPrice,
      deliveryPrice: deliveryFee,
      taxPrice: taxFee,
      totalPrice: totalPayment,
    ).then((order) {
      return Future.value(order);
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  void _checkDeliveryFields() {
    if (fullName.isEmpty || state.isEmpty || city.isEmpty || address.isEmpty) {
      isFormError = true;
      notifyListeners();
    } else {
      isFormError = false;
      notifyListeners();
    }
  }

  void onChangedFullName(String fullName) {
    this.fullName = fullName;
  }

  void onChangedState(String state) {
    this.state = state;
  }

  void onChangedCity(String city) {
    this.city = city;
  }

  void onChangedAddress(String address) {
    this.address = address;
  }

  void onChoosePaymentMethod(String paymentMethodValue) {
    paymentMethod = paymentMethodValue;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
