// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_iot/constants/theme.dart';
import 'package:test_firebase_iot/widgets/menu_items.dart';

class HeaderWithMenu extends StatelessWidget {
  const HeaderWithMenu({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: edge * 1),
      // It will cover 20% of our total height
      height: MediaQuery.of(context).size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: edge,
              right: edge,
              bottom: 36 + edge,
            ),
            height: MediaQuery.of(context).size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: <Widget>[
                Image.asset("assets/images/ic_profile.png"),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat Datang, ',
                      style: whiteTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'UJI COBA',
                      style: whiteTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                // Icon(
                //   CupertinoIcons.bell_fill,
                //   color: whiteColor,
                // ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: edge),
              padding: EdgeInsets.symmetric(vertical: edge),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: purpleColor.withOpacity(0.23),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Wrap(
                    spacing: 50,
                    runSpacing: 25,
                    children: [
                      MenuItems(
                        icon: 'assets/icons/new-file-icon.svg',
                        title: 'Mulai Belanja',
                        press: () => {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => NewNotePage(),
                          //   ),
                          // ),
                        },
                      ),
                      MenuItems(
                          icon: 'assets/icons/file-icon.svg',
                          title: 'History Belanja',
                          press: () => {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
