import 'package:empress_ecommerce_app/blocs/product_detail_bloc.dart';
import 'package:empress_ecommerce_app/dummy/dummy_list.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RatingAndCommentView extends StatefulWidget {
  final Function(int) onChangeDropdown;
  final Function(String) onChangedTextField;
  final Function onTappedButton;

  RatingAndCommentView({
    required this.onChangeDropdown,
    required this.onChangedTextField,
    required this.onTappedButton,
  });

  @override
  State<RatingAndCommentView> createState() => _RatingAndCommentViewState();
}

class _RatingAndCommentViewState extends State<RatingAndCommentView> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductDetailBloc>(
      builder: (context, bloc, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButton<int>(
            value: bloc.dropdownValue,
            items: dummyRatingList
                .map(
                  (value) => DropdownMenuItem<int>(
                value: value,
                child: Text(getText(value)),
              ),
            )
                .toList(),
            onChanged: (newValue) {
              print("New value is $newValue");
              widget.onChangeDropdown(newValue ?? 0);
              // setState(() {
              //   dropdownValue = newValue ?? 0;
              // });
            },
          ),
          SizedBox(height: MARGIN_MEDIUM_2),
          CommentTitleView(),
          SizedBox(height: MARGIN_MEDIUM),
          CommentTextFieldView(
            text: bloc.comment,
            onChanged: (text) {
              widget.onChangedTextField(text);
            },
          ),
          SizedBox(height: MARGIN_MEDIUM),
          CommentButtonView(
            onTap: () {
              widget.onTappedButton();
            },
          ),
        ],
      ),
    );
  }

  String getText(int index) {
    return dummyRatingTexts[index];
  }
}

class CommentButtonView extends StatelessWidget {
  final Function onTap;

  CommentButtonView({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blueAccent,
      highlightElevation: 0,
      onPressed: () {
        onTap();
      },
      child: Text(
        "Comment",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class CommentTitleView extends StatelessWidget {
  const CommentTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Comment",
      style: TextStyle(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class CommentTextFieldView extends StatelessWidget {
  final Function(String) onChanged;
  final String text;

  CommentTextFieldView({required this.onChanged, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      controller: TextEditingController(text: text),
      onChanged: (text) {
        onChanged(text);
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: BORDER_COLOR),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: BORDER_COLOR),
          ),
          hintText: "Feedback",
          hintStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.4),
          )),
    );
  }
}
