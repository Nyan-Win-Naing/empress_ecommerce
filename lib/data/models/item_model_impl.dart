import 'package:empress_ecommerce_app/data/models/item_model.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/network/dataagents/empress_data_agent.dart';
import 'package:empress_ecommerce_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:empress_ecommerce_app/persistence/daos/item_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class ItemModelImpl extends ItemModel {
  static final ItemModelImpl _singleton = ItemModelImpl._internal();

  factory ItemModelImpl() {
    return _singleton;
  }

  ItemModelImpl._internal();

  EmpressDataAgent mDataAgent = RetrofitDataAgentImpl();

  /// Daos
  ItemDao mItemDao = ItemDao();

  /// Network
  @override
  void getNewArrivalItems() {
    mDataAgent.getNewArrivalItems().then((items) async {
      print(items);
      mItemDao.saveItems(items);
    });
  }

  /// Database
  @override
  Stream<List<ItemVO>> getNewArrivalItemsFromDatabase() {
    getNewArrivalItems();
    return mItemDao
        .getAllItemsEventStream()
        .startWith(mItemDao.getAllItemsStream())
        .map((event) => mItemDao.getAllItemsForReactive());
  }
}
