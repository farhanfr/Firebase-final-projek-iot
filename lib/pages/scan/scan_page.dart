// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_firebase_iot/pages/scan/components/body.dart';
import 'package:test_firebase_iot/constants/theme.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyBgColor,
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: purpleColor,
      elevation: 0,
    );
  }
}
