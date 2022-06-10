import 'package:flutter/material.dart';
import 'package:test_firebase_iot/pages/home/components/HeaderWithMenu.dart';
import 'package:test_firebase_iot/constants/theme.dart';

class Body extends StatelessWidget {

  final String username;

  const Body({Key? key, this.username = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        HeaderWithMenu(username: username,size: size),
        SizedBox(height: edge),
      ],
    );
  }
}
