import 'package:empress_ecommerce_app/dummy/dummy_list.dart';
import 'package:empress_ecommerce_app/resources/colors.dart';
import 'package:empress_ecommerce_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class RatingAndCommentView extends StatefulWidget {
  @override
  State<RatingAndCommentView> createState() => _RatingAndCommentViewState();
}

class _RatingAndCommentViewState extends State<RatingAndCommentView> {
  String dropdownValue = "Rating";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: dropdownValue,
          items: dummyRatingList
              .map(
                (value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: (newValue) {
            print("New value is $newValue");
            setState(() {
              dropdownValue = newValue ?? "";
            });
          },
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        CommentTitleView(),
        SizedBox(height: MARGIN_MEDIUM),
        CommentTextFieldView(),
        SizedBox(height: MARGIN_MEDIUM),
        CommentButtonView(),
      ],
    );
  }
}

class CommentButtonView extends StatelessWidget {
  const CommentButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blueAccent,
      highlightElevation: 0,
      onPressed: () {},
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
  const CommentTextFieldView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
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
