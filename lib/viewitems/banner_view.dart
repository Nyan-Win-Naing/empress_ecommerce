import 'package:empress_ecommerce_app/dummy/banner_vo.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  final BannerVO banner;

  BannerView({required this.banner});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: BannerImageView(banner: banner),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black26,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: BannerTitleAndDescriptionView(banner: banner),
          ),
        ),
      ],
    );
  }
}

class BannerTitleAndDescriptionView extends StatelessWidget {
  const BannerTitleAndDescriptionView({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final BannerVO banner;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          banner.title ?? "",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: TEXT_HEADING_1X,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        Text(
          banner.description ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        SizedBox(height: MARGIN_MEDIUM),
        MaterialButton(
          color: Colors.blue,
          onPressed: () {},
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(MARGIN_SMALL),
          ),
          child: Text(
            "Show More",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class BannerImageView extends StatelessWidget {
  const BannerImageView({
    Key? key,
    required this.banner,
  }) : super(key: key);

  final BannerVO banner;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      banner.image ?? "",
      fit: BoxFit.cover,
    );
  }
}
