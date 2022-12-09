import 'package:empress_ecommerce_app/dummy/dummy_list.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/viewitems/customer_review_view.dart';
import 'package:empress_ecommerce_app/widgets/add_to_cart_button_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:empress_ecommerce_app/widgets/rating_and_comment_view.dart';
import 'package:empress_ecommerce_app/widgets/rating_view.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Logitech G240",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
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
            child: Icon(
              Icons.add_shopping_cart,
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
              Padding(
                padding: const EdgeInsets.only(
                  top: MARGIN_MEDIUM_3,
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                ),
                child: ProductImageAndNameSectionView(),
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: CartAndInStockSectionView(),
              ),
              SizedBox(height: MARGIN_MEDIUM_2),
              AboutProductSectionView(),
              SizedBox(height: MARGIN_MEDIUM_2),
              ReviewSectionView(),
              SizedBox(height: MARGIN_MEDIUM_2),
              WriteReviewSectionView(),
              SizedBox(height: MARGIN_LARGE),
            ],
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
          child: RatingAndCommentView(),
        ),
      ],
    );
  }
}

class ReviewSectionView extends StatelessWidget {
  const ReviewSectionView({
    Key? key,
  }) : super(key: key);

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
          child: CustomerReviewView(),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: SeeAllTextView(),
        ),
      ],
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
  const AboutProductSectionView({
    Key? key,
  }) : super(key: key);

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
              ProductDescriptionView(label: "Brand", description: "Logitech G"),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Model", description: "Logitech G240"),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Operating System", description: "Optional"),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Graphic Card", description: "Optional"),
              SizedBox(height: MARGIN_MEDIUM_2),
              ProductDescriptionView(
                  label: "Description",
                  description:
                      "Logitech G240 Cloth Gaming Mouse Pad for Low DPI Gaming"),
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
  const CartAndInStockSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AddToCartButtonView(),
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
  const ProductImageAndNameSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          "https://res.cloudinary.com/dqscrfky2/image/upload/v1666593361/u5vmwuhm00kagvkarmme.png",
          height: 100,
        ),
        SizedBox(width: MARGIN_MEDIUM_2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Logitech G240",
              style: TextStyle(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              "\$ 9.99",
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM),
            RatingView(),
            SizedBox(height: MARGIN_MEDIUM),
            Text(
              "1 Reviews",
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
