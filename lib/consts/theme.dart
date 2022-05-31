import 'package:flutter/material.dart';

abstract class Apptheme {
  static ThemeData basic() => ThemeData(
      fontFamily: 'Matter',
      textTheme: const TextTheme(
        headline1: headline1,
        headline2: headline2,
        headline3: headline3,
        bodyText1: bodyText1,
        bodyText2: bodyText2,
        subtitle1: subtitle1,
        subtitle2: subtitle2,
      ));

  static const gray = Color(0xffF0F2F5);
  static const black = Color(0xff111111);
  static const deepGray = Color(0xff444444);
  static const darkGray = Color(0xff656565);
  static const white = Color(0xffffffff);
  static const lightGray = Color(0xff9C9C9C);
  static const orange = Color(0xffEC4E27);
  static const lightOrange = Color(0xffF47E61);
  static const purple = Color(0xff6B34C3);
  static const lightPurple = Color(0xff8E5EDB);
  static const blue = Color(0xff3465C3);
  static const lightBlue = Color(0xff5785DE);
  static const fadedBlue = Color(0xff87C6F5);

  static const headline1 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: black,
    fontFamily: 'Matter',
  );
  static const headline2 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: black,
    fontFamily: 'Matter',
  );
  static const headline3 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: white,
    fontFamily: 'Matter',
  );
  static const bodyText1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
    fontFamily: 'Matter',
    color: deepGray,
  );
  static const bodyText2 = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: darkGray,
    fontFamily: 'Matter',
  );
  static const subtitle1 = TextStyle(
    fontSize: 10,
    fontFamily: 'Matter',
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const subtitle2 = TextStyle(
    fontFamily: 'Matter',
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: lightGray,
  );
}
