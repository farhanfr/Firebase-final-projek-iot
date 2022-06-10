import 'package:flutter/material.dart';
import 'package:test_firebase_iot/pages/home/components/HeaderWithMenu.dart';
import 'package:test_firebase_iot/constants/theme.dart';
import 'package:test_firebase_iot/pages/scan/components/scan.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return Scan();
  }
}
