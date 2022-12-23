import 'package:empress_ecommerce_app/blocs/home_bloc.dart';
import 'package:empress_ecommerce_app/blocs/product_detail_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/data/vos/review_vo.dart';
import 'package:empress_ecommerce_app/dummy/dummy_list.dart';
import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/utils/show_snack_bar.dart';
import 'package:empress_ecommerce_app/viewitems/customer_review_view.dart';
import 'package:empress_ecommerce_app/widgets/add_to_cart_button_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:empress_ecommerce_app/widgets/rating_and_comment_view.dart';
import 'package:empress_ecommerce_app/widgets/rating_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  final String itemId;

  ProductDetailPage({required this.itemId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailBloc(itemId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Selector<ProductDetailBloc, ItemVO?>(
            selector: (context, bloc) => bloc.item,
            builder: (context, item, child) => Text(
              item?.name ?? "",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: MARGIN_MEDIUM),
              child: GestureDetector(
                onTap: () {
                  navigateToNextPage(context, EmpressApp(specificTab: 2));
                },
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Selector<ProductDetailBloc, ItemVO?>(
              selector: (context, bloc) => bloc.item,
              builder: (context, item, child) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: MARGIN_MEDIUM_3,
                      left: MARGIN_MEDIUM_2,
                      right: MARGIN_MEDIUM_2,
                    ),
                    child: ProductImageAndNameSectionView(item: item),
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: CartAndInStockSectionView(
                      onTap: () {
                        ProductDetailBloc bloc = Provider.of<ProductDetailBloc>(
                            context,
                            listen: false);
                        bloc.onTapAddToCart().then((value) {
                          showSnackBarWithMessage(
                              context, "Added product to cart!");
                        }).catchError((error) {
                          showSnackBarWithMessage(context, error.toString());
                        });
                      },
                    ),
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  AboutProductSectionView(
                    item: item,
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  Visibility(
                    visible: (item?.numberOfReviews ?? 0) != 0,
                    child: ReviewSectionView(
                      reviewVo: (item?.reviews?.isNotEmpty ?? false)
                          ? item?.reviews?.last
                          : ReviewVO(),
                      reviewList: item?.reviews ?? [],
                    ),
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2),
                  WriteReviewSectionView(),
                  SizedBox(height: MARGIN_LARGE),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WriteReviewSectionView extends StatefulWidget {
  const WriteReviewSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<WriteReviewSectionView> createState() => _WriteReviewSectionViewState();
}

class _WriteReviewSectionViewState extends State<WriteReviewSectionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: ProductListTitleView(title: "Write a Review"),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: BORDER_COLOR),
          ),
          child: RatingAndCommentView(
            onChangeDropdown: (dropdownValue) {
              ProductDetailBloc bloc =
                  Provider.of<ProductDetailBloc>(context, listen: false);
              bloc.onChangedDropdown(dropdownValue);
            },
            onChangedTextField: (comment) {
              ProductDetailBloc bloc =
                  Provider.of<ProductDetailBloc>(context, listen: false);
              bloc.onChangedComment(comment);
            },
            onTappedButton: () {
              ProductDetailBloc bloc =
                  Provider.of<ProductDetailBloc>(context, listen: false);
              bloc.onTappedButton().then((value) {}).catchError((error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}

class ReviewSectionView extends StatelessWidget {
  final ReviewVO? reviewVo;
  final List<ReviewVO> reviewList;

  ReviewSectionView({
    required this.reviewVo,
    required this.reviewList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: ProductListTitleView(title: "Reviews"),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: BORDER_COLOR),
          ),
          child: CustomerReviewView(review: reviewVo),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: GestureDetector(
            onTap: () {
              showAlertDialog(context, reviewList);
            },
            child: SeeAllTextView(),
          ),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context, List<ReviewVO> reviewList) {
    // set up the Alert Dialog
    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Padding(
        padding: const EdgeInsets.only(
            left: MARGIN_MEDIUM, right: MARGIN_MEDIUM, top: MARGIN_MEDIUM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: SECONDARY_DARK_COLOR,
                    size: MARGIN_MEDIUM_3,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            SizedBox(height: MARGIN_MEDIUM),
            Container(
              height: MediaQuery.of(context).size.height * 1.5 / 3,
              child: ListView.separated(
                padding: EdgeInsets.only(
                    right: MARGIN_MEDIUM,
                    left: MARGIN_MEDIUM,
                    bottom: MARGIN_CARD_MEDIUM_2),
                itemCount: reviewList.length,
                itemBuilder: (context, index) {
                  return CustomerReviewView(review: reviewList[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: MARGIN_LARGE);
                },
              ),
            ),
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}

class SeeAllTextView extends StatelessWidget {
  const SeeAllTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "See All",
          style: TextStyle(
            color: Colors.blueAccent,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class AboutProductSectionView extends StatelessWidget {
  final ItemVO? item;

  AboutProductSectionView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: ProductListTitleView(title: "About Product"),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: BORDER_COLOR),
          ),
          child: Column(
            children: [
              ProductDescriptionView(
                  label: "Brand", description: item?.brand ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Model", description: item?.modelName ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Operating System",
                  description: item?.operatingSystem ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Graphic Card", description: item?.graphicCard ?? ""),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Description", description: item?.description ?? ""),
            ],
          ),
        ),
      ],
    );
  }
}

class ProductDescriptionView extends StatelessWidget {
  final String label;
  final String description;

  ProductDescriptionView({required this.label, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 120,
          child: Text(
            "$label :",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(width: MARGIN_CARD_MEDIUM_2),
        Expanded(
          child: Text(
            description,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}

class CartAndInStockSectionView extends StatelessWidget {
  final Function onTap;

  CartAndInStockSectionView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddToCartButtonView(
          onTap: () {
            onTap();
          },
        ),
        SizedBox(width: MARGIN_MEDIUM),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM),
          decoration: BoxDecoration(
            color: IN_STOCK_BUTTON_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          ),
          child: Text(
            "In Stock",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class ProductImageAndNameSectionView extends StatelessWidget {
  final ItemVO? item;

  ProductImageAndNameSectionView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          item?.image ??
              "https://media.istockphoto.com/id/1147544807/vector/thumbnail-image-vector-graphic.jpg?s=612x612&w=0&k=20&c=rnCKVbdxqkjlcs3xH87-9gocETqpspHFXu5dIGB4wuM=",
          height: 100,
        ),
        SizedBox(width: MARGIN_MEDIUM_2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item?.name ?? "",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              "\$ ${item?.price}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            RatingView(rating: item?.rating ?? 0),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              "${item?.numberOfReviews} Reviews",
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
