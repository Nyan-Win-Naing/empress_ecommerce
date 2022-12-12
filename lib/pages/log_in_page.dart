import 'package:empress_ecommerce_app/blocs/log_in_bloc.dart';
import 'package:empress_ecommerce_app/pages/empress_app.dart';
import 'package:empress_ecommerce_app/pages/sign_up_page.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:empress_ecommerce_app/widgets/label_and_text_field_view.dart';
import 'package:empress_ecommerce_app/widgets/loading_view.dart';
import 'package:empress_ecommerce_app/widgets/login_signup_navigator_text.dart';
import 'package:empress_ecommerce_app/widgets/sign_in_title_view.dart';
import 'package:empress_ecommerce_app/widgets/sign_in_welcome_text.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogInBloc(),
      child: Selector<LogInBloc, bool>(
        selector: (context, bloc) => bloc.isLoading,
        builder: (context, isLoading, child) => Stack(
          children: [
            Scaffold(
              backgroundColor: SECONDARY_COLOR,
              body: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: MARGIN_XXLARGE * 2),
                      SignInTitleView(title: "Log In"),
                      SizedBox(height: MARGIN_MEDIUM_2),
                      SignInWelcomeText(title: "Welcome to Empress!"),
                      SizedBox(height: MARGIN_XXLARGE),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_2),
                        child: LogInSectionView(),
                      ),
                      SizedBox(height: MARGIN_XLARGE),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_2),
                        child: LoginSignupNavigatorText(
                          label: "Don't have an account yet?",
                          navigatorLabel: "Sign Up",
                          onTap: () {
                            _navigateToSignUpPage(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: LoadingView(),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToSignUpPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }
}

class LogInSectionView extends StatelessWidget {
  const LogInSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabelAndTextFieldView(
          label: "Email",
          hintText: "Please enter your email",
          isSignIn: true,
          onChanged: (value) {
            LogInBloc bloc = Provider.of<LogInBloc>(context, listen: false);
            bloc.onEmailChanged(value);
          },
        ),
        SizedBox(height: MARGIN_XLARGE),
        LabelAndTextFieldView(
          label: "Password",
          hintText: "Please enter your email",
          isSignIn: true,
          isPasswordField: true,
          onChanged: (value) {
            LogInBloc bloc = Provider.of<LogInBloc>(context, listen: false);
            bloc.onPasswordChanged(value);
          },
        ),
        SizedBox(height: MARGIN_XLARGE),
        MaterialButton(
          color: Colors.white,
          onPressed: () {
            LogInBloc bloc = Provider.of<LogInBloc>(context, listen: false);
            bloc.onTapLogin().then((value) {
              _navigateToEmpressApp(context);
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    error.toString(),
                  ),
                ),
              );
            });
            // _navigateToEmpressApp(context);
          },
          minWidth: double.infinity,
          height: MARGIN_40,
          child: Text(
            "Log in",
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
