import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/label_and_text_field_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Account Info",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            child: Icon(
              Icons.logout,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MARGIN_MEDIUM_3),
              ProfileSectionView(),
              SizedBox(height: MARGIN_XXLARGE),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: EditProfileSectionView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileSectionView extends StatelessWidget {
  const EditProfileSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductListTitleView(title: "Edit Account"),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_CARD_MEDIUM_2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            border: Border.all(color: BORDER_COLOR)
          ),
          child: Column(
            children: [
              LabelAndTextFieldView(label: "Name", hintText: "Maung Maung"),
              SizedBox(height: MARGIN_LARGE),
              LabelAndTextFieldView(
                  label: "Email", hintText: "maungmaung123@gmail.com"),
              SizedBox(height: MARGIN_LARGE),
              LabelAndTextFieldView(
                label: "Password",
                hintText: "Please enter your update password",
                isPasswordField: true,
              ),
              SizedBox(height: MARGIN_LARGE),
              EditButtonView(),
            ],
          ),
        ),
      ],
    );
  }
}

class EditButtonView extends StatelessWidget {
  const EditButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: Colors.blueAccent,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(MARGIN_MEDIUM),
      ),
      onPressed: () {},
      height: 40,
      child: Text(
        "Save Changes",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ProfileSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.05),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage("assets/profile_placeholder.jpg"),
              ),
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM_2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Maung Maung",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: TEXT_REGULAR_2X,
                  color: SECONDARY_DARK_COLOR,
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM),
              Text(
                "maungmaung123@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM),
              MaterialButton(
                onPressed: () {},
                color: ORDER_BUTTON_COLOR,
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
                elevation: 0,
                highlightElevation: 0,
                height: MARGIN_XLARGE,
                child: Text(
                  "Orders History",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
