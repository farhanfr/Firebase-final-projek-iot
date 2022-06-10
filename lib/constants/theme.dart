import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color purpleColor = Color(0xff302A69);
Color blackColor = Color(0xff000000);
Color whiteColor = Color(0xffFFFFFF);
Color greyColor = Color(0xffB1B0BA);
Color skeletoneColor = Color(0xffF7F6F9);
Color greyBgColor = Color(0xffF4F4F4);

double edge = 24;

TextStyle blackTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w300,
  color: greyColor,
);

TextStyle purpleTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w500,
  color: purpleColor,
);

TextStyle regularTextStyle = GoogleFonts.nunito(
  fontWeight: FontWeight.w400,
  color: blackColor,
);

InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: whiteColor,
);
