import 'package:empress_ecommerce_app/data/models/user_model_impl.dart';
import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/pages/log_in_page.dart';
import 'package:empress_ecommerce_app/persistence/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  await Hive.initFlutter();

  Hive.registerAdapter(UserVOAdapter());
  Hive.registerAdapter(ItemVOAdapter());
  Hive.registerAdapter(ReviewVOAdapter());
  Hive.registerAdapter(CategoryVOAdapter());

  await Hive.openBox<UserVO>(BOX_NAME_USER_VO);
  await Hive.openBox<ItemVO>(BOX_NAME_ITEM_VO);
  await Hive.openBox<CategoryVO>(BOX_NAME_CATEGORY_VO);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _userModel = UserModelImpl();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: EmpressApp(),
      home: (_userModel.isLoggedIn()) ? EmpressApp() :  LogInPage(),
    );
  }
}
