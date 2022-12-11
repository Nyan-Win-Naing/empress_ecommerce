import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/pages/log_in_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/label_and_text_field_view.dart';
import 'package:empress_ecommerce_app/widgets/login_signup_navigator_text.dart';
import 'package:empress_ecommerce_app/widgets/sign_in_title_view.dart';
import 'package:empress_ecommerce_app/widgets/sign_in_welcome_text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY_COLOR,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MARGIN_XXLARGE * 2),
              SignInTitleView(title: "Sign In"),
              SizedBox(height: MARGIN_MEDIUM_2),
              SignInWelcomeText(title: "Create New Account"),
              SizedBox(height: MARGIN_XXLARGE),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: SignUpSectionView(),
              ),
              SizedBox(height: MARGIN_XLARGE),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                child: LoginSignupNavigatorText(
                  label: "Already have an account?",
                  navigatorLabel: "Log In",
                  onTap: () {
                    _navigateToLoginPage(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogInPage(),
      ),
    );
  }
}

class SignUpSectionView extends StatelessWidget {
  const SignUpSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelAndTextFieldView(
          label: "Name",
          hintText: "Please enter your name",
          isSignIn: true,
        ),
        SizedBox(height: MARGIN_XLARGE),
        LabelAndTextFieldView(
          label: "Email",
          hintText: "Please enter your email",
          isSignIn: true,
        ),
        SizedBox(height: MARGIN_XLARGE),
        LabelAndTextFieldView(
          label: "Password",
          hintText: "Please enter your email",
          isSignIn: true,
          isPasswordField: true,
        ),
        SizedBox(height: MARGIN_XLARGE),
        MaterialButton(
          color: Colors.white,
          onPressed: () {
            _navigateToEmpressApp(context);
          },
          minWidth: double.infinity,
          height: MARGIN_40,
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: SECONDARY_COLOR,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToEmpressApp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmpressApp(),
      ),
    );
  }
}