import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/category_chip_view.dart';
import 'package:empress_ecommerce_app/viewitems/product_view_for_grid.dart';
import 'package:empress_ecommerce_app/viewitems/product_view_for_vertical.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String view = "listView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Shop",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MARGIN_MEDIUM),
              HorizontalCategoryListSectionView(),
              SizedBox(height: MARGIN_MEDIUM),
              FilterSectionView(
                onTapChangeView: () {
                  setState(() {
                    if (view == "listView") {
                      view = "3xGrid";
                    } else if (view == "3xGrid") {
                      view = "2xGrid";
                    } else {
                      view = "listView";
                    }
                  });
                },
                view: view,
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductListSectionView(view: view),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductListSectionView extends StatelessWidget {
  final String view;

  ProductListSectionView({required this.view});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Text(
            "26 results",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: MARGIN_XLARGE),
        (view == "listView")
            ? VerticalProductListView()
            : (view == "3xGrid")
                ? Grid3xProductListView()
                : Grid2xProductListView(),
        // VerticalProductListView(),
        // Grid3xProductListView(),
        // Grid2xProductListView(),
      ],
    );
  }
}

class Grid3xProductListView extends StatelessWidget {
  const Grid3xProductListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.2 / 4,
      ),
      itemBuilder: (context, index) {
        return ProductViewForGrid();
      },
    );
  }
}

class Grid2xProductListView extends StatelessWidget {
  const Grid2xProductListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 10,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4.5,
      ),
      itemBuilder: (context, index) {
        return ProductViewForGrid(is3xGrid: false);
      },
    );
  }
}

class VerticalProductListView extends StatelessWidget {
  const VerticalProductListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductViewForVertical();
      },
    );
  }
}

class FilterSectionView extends StatelessWidget {
  final Function onTapChangeView;
  final String view;

  FilterSectionView({required this.onTapChangeView, required this.view});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterNameAndIconView(
            label: "Sort by",
            iconData: Icons.sort,
            onTap: () {},
          ),
          FilterNameAndIconView(
            label: "Ratings",
            iconData: Icons.repeat,
            onTap: () {},
          ),
          FilterNameAndIconView(
            label: "Change view",
            iconData: getIcon(),
            onTap: () {
              onTapChangeView();
            },
          ),
        ],
      ),
    );
  }

  IconData getIcon() {
    if (view == "listView") {
      return Icons.grid_on;
    } else if (view == "3xGrid") {
      return Icons.grid_view;
    } else {
      return Icons.reorder;
    }
  }
}

class FilterNameAndIconView extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Function onTap;

  FilterNameAndIconView({
    required this.label,
    required this.iconData,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterTitleView(title: label),
        SizedBox(height: MARGIN_MEDIUM),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Icon(
            iconData,
            color: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}

class FilterTitleView extends StatelessWidget {
  final String title;

  FilterTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: TEXT_13,
        color: SECONDARY_DARK_COLOR,
      ),
    );
  }
}

class HorizontalCategoryListSectionView extends StatelessWidget {
  const HorizontalCategoryListSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // color: Colors.blue,
      child: ListView.builder(
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryChipView();
        },
      ),
    );
  }
}
