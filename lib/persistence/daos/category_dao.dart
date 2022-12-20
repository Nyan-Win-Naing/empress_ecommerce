import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

class CategoryDao {
  static final CategoryDao _singleton = CategoryDao._internal();

  factory CategoryDao() {
    return _singleton;
  }

  CategoryDao._internal();

  Box<CategoryVO> getCategoryBox() {
    return Hive.box<CategoryVO>(BOX_NAME_CATEGORY_VO);
  }

  void saveCategories(List<CategoryVO>? categories) async {
    Map<String, CategoryVO> categoryMap = Map.fromIterable(
      categories ?? [],
      key: (category) => category.category,
      value: (category) => category,
    );
    await getCategoryBox().putAll(categoryMap);
  }

  List<CategoryVO> getAllCategories() {
    return getCategoryBox().values.toList();
  }

  /// Reactive Programming
  Stream<void> getAllCategoriesEventStream() {
    return getCategoryBox().watch();
  }

  Stream<List<CategoryVO>> getCategoriesStream() {
    return Stream.value(getAllCategories());
  }

  List<CategoryVO> getCategoriesReactive() {
    if(getAllCategories() != null && getAllCategories().isNotEmpty) {
      return getAllCategories();
    } else {
      return [];
    }
  }
}
