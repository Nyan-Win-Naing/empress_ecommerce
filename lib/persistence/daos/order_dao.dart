import 'package:empress_ecommerce_app/data/vos/order/order_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class OrderDao {
  static final OrderDao _singleton = OrderDao._internal();

  factory OrderDao() {
    return _singleton;
  }

  OrderDao._internal();

  Box<OrderVO> getOrderBox() {
    return Hive.box<OrderVO>(BOX_NAME_ORDER_VO);
  }

  void saveOrders(List<OrderVO>? orders) async {
    Map<String, OrderVO> orderMap = Map.fromIterable(
      orders ?? [],
      key: (order) => order.id,
      value: (order) => order,
    );
    await getOrderBox().putAll(orderMap);
  }

  void saveSingleOrder(OrderVO? order) async {
    await getOrderBox().put(order!.id, order);
  }

  void removeAllOrdersFromDatabase() async {
    await getOrderBox().deleteAll(getOrderBox().keys.toList());
  }

  List<OrderVO> getAllOrders() {
    return getOrderBox().values.toList();
  }

  OrderVO? getOrderById(String orderId) {
    return getOrderBox().get(orderId);
  }

  /// Reactive
  Stream<void> getAllOrdersEventStream() {
    return getOrderBox().watch();
  }

  Stream<List<OrderVO>> getAllOrdersStream() {
    return Stream.value(getAllOrders());
  }

  List<OrderVO> getAllOrdersReactive() {
    if(getAllOrders() != null && getAllOrders().isNotEmpty) {
      return getAllOrders();
    } else {
      return [];
    }
  }
}
