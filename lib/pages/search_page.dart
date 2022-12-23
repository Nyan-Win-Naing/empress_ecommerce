import 'package:empress_ecommerce_app/blocs/search_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/pages/product_detail_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/utils/text_field_debouncer.dart';
import 'package:empress_ecommerce_app/viewitems/search_item_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final _debouncer = TextFieldDebounder(milliseconds: 700);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchBloc(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          title: Builder(builder: (context) {
            return TextField(
              onChanged: (text) {
                _debouncer.run(() {
                  SearchBloc bloc =
                      Provider.of<SearchBloc>(context, listen: false);
                  bloc.onSearch(text);
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                    bottom: MARGIN_CARD_MEDIUM_2, top: MARGIN_SMALL),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ORDER_BUTTON_COLOR, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 1.5),
                ),
                isDense: true,
                hintText: "Search Products",
                hintStyle: TextStyle(
                  color: BOTTOM_SHEET_ICON_COLOR,
                ),
              ),
            );
          }),
        ),
        body: Selector<SearchBloc, List<ItemVO>>(
          selector: (context, bloc) => bloc.mSearchedItemList ?? [],
          builder: (context, searchedItemList, child) => Container(
            child: (searchedItemList.isNotEmpty)
                ? ListView.builder(
                    padding: const EdgeInsets.only(
                      top: MARGIN_MEDIUM_2,
                      left: MARGIN_MEDIUM_2,
                      right: MARGIN_MEDIUM_2,
                    ),
                    itemCount: searchedItemList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          navigateToNextPage(context, ProductDetailPage(itemId: searchedItemList[index].id ?? ""));
                        },
                        child: SearchItemView(
                          itemVo: searchedItemList[index],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "There is no searched items.",
                      style: TextStyle(
                          color: BOTTOM_SHEET_ICON_COLOR,
                          fontWeight: FontWeight.w700,
                          fontSize: TEXT_REGULAR_2X),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
