import 'package:test_firebase_iot/constants/theme.dart';
import 'package:flutter/material.dart';

class ButtonFull extends StatelessWidget {
  final VoidCallback press;
  final String title;

  const ButtonFull({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: press,
        color: purpleColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: whiteTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
