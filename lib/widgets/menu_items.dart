// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_firebase_iot/constants/theme.dart';

class MenuItems extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback press;
  const MenuItems({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: purpleColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                icon,
                color: whiteColor,
                width: 24,
                height: 24,
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(title,
              style: purpleTextStyle.copyWith(
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
