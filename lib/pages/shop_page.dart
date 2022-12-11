import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/category_chip_view.dart';
import 'package:empress_ecommerce_app/viewitems/product_view_for_grid.dart';
import 'package:empress_ecommerce_app/viewitems/product_view_for_vertical.dart';
import 'package:empress_ecommerce_app/widgets/rating_view.dart';
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
            onTap: () {
              _sortByBottomSheet(context);
            },
          ),
          FilterNameAndIconView(
            label: "Ratings",
            iconData: Icons.repeat,
            onTap: () {
              _ratingsBottomSheet(context);
            },
          ),
          FilterNameAndIconView(
            label: "Views",
            iconData: getIcon(),
            onTap: () {
              onTapChangeView();
            },
          ),
        ],
      ),
    );
  }

  void _ratingsBottomSheet(BuildContext context) {

    double groupValue = 4.0;

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomSheetTitleView(title: "Sort by ratings"),
                SizedBox(height: MARGIN_MEDIUM),
                BottomSheetDivider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioViewForRating(
                        rating: 4,
                        value: 4,
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 3,
                        value: 3,
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 2,
                        value: 2,
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 1,
                        value: 1,
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 0,
                        value: 0,
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _sortByBottomSheet(BuildContext context) {
    String groupValue = "new_arrivals";

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomSheetTitleView(title: "Sort by"),
                SizedBox(height: MARGIN_MEDIUM),
                BottomSheetDivider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioViewForSortBy(
                        title: "New Arrivals",
                        value: "new_arrivals",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForSortBy(
                        title: "Price: Low to High",
                        value: "low_to_high",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForSortBy(
                        title: "Price: High to Low",
                        value: "high_to_low",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                      RadioViewForSortBy(
                        title: "Customer Rating",
                        value: "customer_rating",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        );
      },
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

class RadioViewForSortBy extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function(String) onTap;

  RadioViewForSortBy({
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: TextStyle(
          color: SECONDARY_DARK_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4, vertical: 0),
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        onTap(value ?? "");
      },
    );
  }
}

class RadioViewForRating extends StatelessWidget {
  final double rating;
  final double value;
  final double groupValue;
  final Function(double) onTap;

  RadioViewForRating({
    required this.rating,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Row(
        children: [
          RatingView(rating: rating),
          SizedBox(width: MARGIN_MEDIUM),
          Text(
            "Up",
            style: TextStyle(
              color: SECONDARY_DARK_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_REGULAR_2X
            ),
          ),
        ],
      ),
      dense: true,
      contentPadding: EdgeInsets.zero,
      visualDensity: VisualDensity(horizontal: -4, vertical: 0),
      value: value,
      groupValue: groupValue,
      onChanged: (value) {
        onTap(value ?? 0);
      },
    );
  }
}

class BottomSheetDivider extends StatelessWidget {
  const BottomSheetDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: BORDER_COLOR,
      thickness: 1.2,
    );
  }
}

class BottomSheetTitleView extends StatelessWidget {
  final String title;

  BottomSheetTitleView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MARGIN_MEDIUM_2,
        left: MARGIN_MEDIUM_2,
        right: MARGIN_MEDIUM_2,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
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
            color: Colors.blue,
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
