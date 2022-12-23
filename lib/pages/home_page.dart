import 'package:dots_indicator/dots_indicator.dart';
import 'package:empress_ecommerce_app/blocs/home_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/item_vo.dart';
import 'package:empress_ecommerce_app/dummy/dummy_list.dart';
import 'package:empress_ecommerce_app/pages/search_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/utils/navigate_to_page.dart';
import 'package:empress_ecommerce_app/viewitems/banner_view.dart';
import 'package:empress_ecommerce_app/viewitems/product_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Empress",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM),
              child: GestureDetector(
                onTap: () {
                  navigateToNextPage(context, SearchPage());
                },
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BannerSectionView(),
                SizedBox(height: MARGIN_MEDIUM_2),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  child: OurServiceSectionView(),
                ),
                SizedBox(height: MARGIN_MEDIUM_2),
                Selector<HomeBloc, List<ItemVO>>(
                  selector: (context, bloc) => bloc.newArrivalItems ?? [],
                  builder: (context, newArrivalItems, child) =>
                      TitleAndHorizontalProductsSectionView(
                    newArrivalItems: newArrivalItems,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleAndHorizontalProductsSectionView extends StatelessWidget {
  final List<ItemVO> newArrivalItems;

  TitleAndHorizontalProductsSectionView({required this.newArrivalItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: ProductListTitleView(title: "New Arrivals"),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        HorizontalProductListView(newArrivalItems: newArrivalItems),
      ],
    );
  }
}

class HorizontalProductListView extends StatelessWidget {
  final List<ItemVO> newArrivalItems;

  HorizontalProductListView({required this.newArrivalItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      child: ListView.builder(
        padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        scrollDirection: Axis.horizontal,
        itemCount: newArrivalItems.length,
        itemBuilder: (context, index) {
          return ProductView(item: newArrivalItems[index]);
        },
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  const BannerSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: PageView(
            onPageChanged: (page) {
              setState(() {
                _position = page.toDouble();
              });
            },
            children: dummyBannerList
                .map(
                  (banner) => BannerView(banner: banner),
                )
                .toList(),
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        DotsIndicator(
          dotsCount: dummyBannerList.length,
          position: _position,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
      ],
    );
  }
}

class OurServiceSectionView extends StatelessWidget {
  const OurServiceSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: ServiceView(
                image: "assets/delievery.png",
                title: "Free Delivery",
                label: "Over \$3000",
              ),
            ),
            SizedBox(width: MARGIN_MEDIUM),
            Expanded(
              flex: 1,
              child: ServiceView(
                image: "assets/payment.png",
                title: "Secure Payment",
                label: "Paypal & Credit",
              ),
            ),
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM),
        ServiceView(
          image: "assets/online_support.png",
          title: "Online Support",
          label: "Support 24/7",
          horizontalMargin: MARGIN_XLARGE,
        ),
      ],
    );
  }
}

class ServiceView extends StatelessWidget {
  final String image;
  final String title;
  final String label;
  final double horizontalMargin;

  ServiceView({
    required this.image,
    required this.title,
    required this.label,
    this.horizontalMargin = MARGIN_MEDIUM,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalMargin,
        vertical: MARGIN_MEDIUM,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          border: Border.all(color: BORDER_COLOR)),
      child: Column(
        children: [
          Image.asset(
            image,
            width: 35,
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM),
          Text(
            label,
          ),
        ],
      ),
    );
  }
}
