import 'package:empress_ecommerce_app/pages/cart_page.dart';
import 'package:empress_ecommerce_app/pages/home_page.dart';
import 'package:empress_ecommerce_app/pages/profile_page.dart';
import 'package:empress_ecommerce_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class EmpressApp extends StatefulWidget {

  final int specificTab;


  EmpressApp({this.specificTab = 0});

  @override
  State<EmpressApp> createState() => _EmpressAppState();
}

class _EmpressAppState extends State<EmpressApp> {

  late int _selectedIndex;


  @override
  void initState() {
    _selectedIndex = widget.specificTab;
    super.initState();
  }

  List<Widget> _widgetOptions = [
    HomePage(),
    ShopPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopify,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
