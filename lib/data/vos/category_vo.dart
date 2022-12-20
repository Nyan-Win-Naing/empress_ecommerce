import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:hive/hive.dart';

part 'category_vo.g.dart';

@HiveType(typeId: HIVE_TYPE_ID_CATEGORY_VO, adapterName: "CategoryVOAdapter")
class CategoryVO {
  @HiveField(0)
  String? category;

  @HiveField(1)
  bool? isSelected;

  CategoryVO({this.category, this.isSelected});
}