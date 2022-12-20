import 'package:empress_ecommerce_app/blocs/home_bloc.dart';
import 'package:empress_ecommerce_app/blocs/shop_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/category_vo.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/pages/product_detail_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/category_chip_view.dart';
import 'package:empress_ecommerce_app/viewitems/product_view_for_grid.dart';
import 'package:empress_ecommerce_app/viewitems/product_view_for_vertical.dart';
import 'package:empress_ecommerce_app/widgets/rating_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopBloc(),
      child: Scaffold(
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
          child: Builder(builder: (context) {
            return ShopPageScrollView(
              onListEndReached: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Text("Loading Data"),
                  ),
                );
                ShopBloc bloc = Provider.of<ShopBloc>(context, listen: false);
                bloc.onItemListEndReached();
              },
            );
          }),
        ),
      ),
    );
  }
}

class ShopPageScrollView extends StatefulWidget {
  final Function onListEndReached;

  ShopPageScrollView({required this.onListEndReached});

  @override
  State<ShopPageScrollView> createState() => _ShopPageScrollViewState();
}

class _ShopPageScrollViewState extends State<ShopPageScrollView> {
  String view = "listView";
  var _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("Start of the list reached");
        } else {
          print("End of the list reached");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM),
          Selector<ShopBloc, List<CategoryVO>>(
            selector: (context, bloc) => bloc.categoryList ?? [],
            shouldRebuild: (previous, next) => previous != next,
            builder: (context, categoryList, child) =>
                HorizontalCategoryListSectionView(
              categoryList: categoryList,
            ),
          ),
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
          Selector<ShopBloc, List<ItemVO>>(
            selector: (context, bloc) => bloc.itemList ?? [],
            builder: (context, itemList, child) => ProductListSectionView(
              view: view,
              itemList: itemList,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListSectionView extends StatelessWidget {
  final String view;
  final List<ItemVO> itemList;

  ProductListSectionView({required this.view, required this.itemList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: Text(
            "${itemList.length} results",
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: MARGIN_XLARGE),
        (view == "listView")
            ? VerticalProductListView(itemList: itemList)
            : (view == "3xGrid")
                ? Grid3xProductListView(itemList: itemList)
                : Grid2xProductListView(itemList: itemList),
        // VerticalProductListView(),
        // Grid3xProductListView(),
        // Grid2xProductListView(),
      ],
    );
  }
}

class Grid3xProductListView extends StatelessWidget {
  final List<ItemVO> itemList;

  Grid3xProductListView({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2.2 / 4,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToProductDetailPage(context, index, itemList);
          },
          child: ProductViewForGrid(
            item: itemList[index],
          ),
        );
      },
    );
  }
}

class Grid2xProductListView extends StatelessWidget {
  final List<ItemVO> itemList;

  Grid2xProductListView({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4.5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToProductDetailPage(context, index, itemList);
          },
          child: ProductViewForGrid(
            is3xGrid: false,
            item: itemList[index],
          ),
        );
      },
    );
  }
}

class VerticalProductListView extends StatelessWidget {
  final List<ItemVO> itemList;

  VerticalProductListView({required this.itemList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            navigateToProductDetailPage(context, index, itemList);
          },
          child: ProductViewForVertical(
            item: itemList[index],
          ),
        );
      },
    );
  }
}

void navigateToProductDetailPage(
    BuildContext context, int index, List<ItemVO> itemList) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductDetailPage(itemId: itemList[index].id ?? ""),
    ),
  );
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
          Selector<ShopBloc, String>(
            selector: (context, bloc) => bloc.sortBy,
            builder: (context, sortBy, child) => FilterNameAndIconView(
              label: "Sort by",
              iconData: Icons.sort,
              onTap: () {
                ShopBloc bloc = Provider.of<ShopBloc>(context, listen: false);
                _sortByBottomSheet(context, sortBy, bloc);
              },
            ),
          ),
          Selector<ShopBloc, String>(
            selector: (context, bloc) => bloc.selectedRating,
            builder: (context, rating, child) => FilterNameAndIconView(
              label: "Ratings",
              iconData: Icons.repeat,
              onTap: () {
                ShopBloc bloc = Provider.of<ShopBloc>(context, listen: false);
                _ratingsBottomSheet(context, rating, bloc);
              },
            ),
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

  void _ratingsBottomSheet(BuildContext context, String rating, ShopBloc bloc) {
    String groupValue = rating;

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
                        value: "4",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapRating(newValue);
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 3,
                        value: "3",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapRating(newValue);
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 2,
                        value: "2",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapRating(newValue);
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 1,
                        value: "1",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapRating(newValue);
                          });
                        },
                      ),
                      RadioViewForRating(
                        rating: 0,
                        value: "0",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapRating(newValue);
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

  void _sortByBottomSheet(BuildContext context, String sortBy, ShopBloc bloc) {
    String groupValue = sortBy;

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
                        value: "newest",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapSortBy(newValue);
                          });
                        },
                      ),
                      RadioViewForSortBy(
                        title: "Price: Low to High",
                        value: "lowest",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapSortBy(newValue);
                          });
                        },
                      ),
                      RadioViewForSortBy(
                        title: "Price: High to Low",
                        value: "highest",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapSortBy(newValue);
                          });
                        },
                      ),
                      RadioViewForSortBy(
                        title: "Customer Rating",
                        value: "toprated",
                        groupValue: groupValue,
                        onTap: (newValue) {
                          setState(() {
                            groupValue = newValue;
                            bloc.onTapSortBy(newValue);
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
  final String value;
  final String groupValue;
  final Function(String) onTap;

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
                fontSize: TEXT_REGULAR_2X),
          ),
        ],
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
  final List<CategoryVO> categoryList;

  HorizontalCategoryListSectionView({required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Selector<ShopBloc, bool>(
      selector: (context, bloc) => bloc.isShowClearButton,
      builder: (context, isShowClearButton, child) => Container(
        height: 60,
        // color: Colors.blue,
        // child: ListView.builder(
        //   padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        //   scrollDirection: Axis.horizontal,
        //   itemCount: categoryList.length,
        //   itemBuilder: (context, index) {
        //     return CategoryChipView(
        //       category: categoryList[index],
        //     );
        //   },
        // ),
        child: ListView(
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          scrollDirection: Axis.horizontal,
          children: [
            Visibility(
              visible: isShowClearButton,
              child: GestureDetector(
                onTap: () {
                  ShopBloc bloc = Provider.of<ShopBloc>(context, listen: false);
                  bloc.onTapClear();
                },
                child: CategoryCloseView(),
              ),
            ),
            ...categoryList.map((categoryVo) {
              return GestureDetector(
                onTap: () {
                  ShopBloc bloc = Provider.of<ShopBloc>(context, listen: false);
                  bloc.onTapCategory(categoryVo.category ?? "");
                },
                child: CategoryChipView(category: categoryVo),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class CategoryCloseView extends StatelessWidget {
  const CategoryCloseView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: CATEGORY_CHIP_COLOR,
      ),
      child: Icon(
        Icons.close,
        color: SECONDARY_DARK_COLOR,
        size: MARGIN_MEDIUM_3,
      ),
    );
  }
}
