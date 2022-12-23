import 'dart:convert';

import 'package:empress_ecommerce_app/blocs/profile_bloc.dart';
import 'package:empress_ecommerce_app/data/vos/user_vo.dart';
import 'package:empress_ecommerce_app/pages/log_in_page.dart';
import 'package:empress_ecommerce_app/pages/order_history_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/label_and_text_field_view.dart';
import 'package:empress_ecommerce_app/widgets/product_list_title_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileBloc(),
      child: Scaffold(
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
              child: Builder(builder: (context) {
                return GestureDetector(
                  onTap: () {
                    ProfileBloc bloc =
                        Provider.of<ProfileBloc>(context, listen: false);
                    showConfirmDialogForLogout(context, bloc);
                  },
                  child: Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                  ),
                );
              }),
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MARGIN_MEDIUM_3),
                Selector<ProfileBloc, UserVO?>(
                  selector: (context, bloc) => bloc.loggedInUser,
                  builder: (context, loggedInUser, child) =>
                      ProfileSectionView(userVo: loggedInUser),
                ),
                SizedBox(height: MARGIN_XXLARGE),
                Selector<ProfileBloc, UserVO?>(
                  selector: (context, bloc) => bloc.loggedInUser,
                  builder: (context, loggedInUser, child) => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                    child: EditProfileSectionView(loggedInUser: loggedInUser),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmDialogForLogout(BuildContext context, ProfileBloc bloc) {
    Widget logoutButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      onPressed: () {
        bloc.onTapLogout().then((value) {
          _navigateToLoginPage(context);
        }).catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Log out fail !"),
            ),
          );
        });
      },
      child: Text(
        "Log Out",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
        backgroundColor: BOTTOM_SHEET_ICON_COLOR,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        "Cancel",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      contentPadding: EdgeInsets.symmetric(
          horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_MEDIUM_2),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/logout_image.png",
            height: 100,
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          Text(
            "Are you sure to logout ?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ORDER_BUTTON_COLOR,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      actions: [
        cancelButton,
        logoutButton,
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LogInPage(),
      ),
    );
  }
}

class EditProfileSectionView extends StatelessWidget {
  final UserVO? loggedInUser;

  EditProfileSectionView({required this.loggedInUser});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductListTitleView(title: "Edit Account"),
        SizedBox(height: MARGIN_MEDIUM_2),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_CARD_MEDIUM_2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              border: Border.all(color: BORDER_COLOR)),
          child: Column(
            children: [
              Selector<ProfileBloc, String>(
                selector: (context, bloc) => bloc.username,
                builder: (context, username, child) => LabelAndTextFieldView(
                  label: "Name",
                  hintText: loggedInUser?.name ?? "",
                  onChanged: (username) {
                    ProfileBloc bloc = Provider.of(context, listen: false);
                    bloc.onNameChanged(username);
                  },
                  textEditingController: TextEditingController(text: username),
                ),
              ),
              SizedBox(height: MARGIN_LARGE),
              Selector<ProfileBloc, String>(
                selector: (context, bloc) => bloc.email,
                builder: (context, email, child) => LabelAndTextFieldView(
                  label: "Email",
                  hintText: loggedInUser?.email ?? "",
                  onChanged: (email) {
                    ProfileBloc bloc = Provider.of(context, listen: false);
                    bloc.onEmailChanged(email);
                  },
                  textEditingController: TextEditingController(text: email),
                ),
              ),
              SizedBox(height: MARGIN_LARGE),
              EditButtonView(
                onTap: () {
                  ProfileBloc bloc = Provider.of(context, listen: false);
                  bloc.onTapUpdate().then((value) {}).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(error.toString()),
                      ),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EditButtonView extends StatelessWidget {
  final Function onTap;

  EditButtonView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      color: Colors.blueAccent,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(MARGIN_MEDIUM),
      ),
      onPressed: () {
        onTap();
      },
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
  final UserVO? userVo;

  ProfileSectionView({required this.userVo});

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
                userVo?.name ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: TEXT_REGULAR_2X,
                  color: SECONDARY_DARK_COLOR,
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM),
              Text(
                userVo?.email ?? "",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM),
              MaterialButton(
                onPressed: () {
                  _navigateToOrderHistoryPage(context);
                },
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

  void _navigateToOrderHistoryPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderHistoryPage(),
      ),
    );
  }
}
