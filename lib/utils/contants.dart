import 'package:flutter/material.dart';

class AppConstants {
  // static const Color greenColor = Color(0xff007b3f);
  // static const Color lightGreenColor = Color.fromARGB(255, 190, 246, 218);
  static const Color orangeColor = Color(0xfff6911e);
  static const Color blackColor = Colors.black;
  static Color indigoColor = Colors.indigo[900]!;
  static Color lightIndigoColor = Colors.indigo[200]!;

  static const Color secondaryColor = Color(0xff536281);

  static const Color lightBlackColor = Colors.black54;
  static const Color whiteColor = Colors.white;
  static const Color lightWhiteColor = Colors.white54;

  static const Color grayColor = Colors.grey;
  static Color lightGrayColor = Colors.grey[200]!;

  static const String logo = "assets/images/logo.png";
  static const String tamaraLogo = "assets/images/tamara_logo.png";
  static const String tabbyLogo = "assets/images/tabby_logo.png";

  static const String emptyCartLogo = "assets/images/empty_cart.png";

//
  static const TextStyle h1Normal = TextStyle(
      color: blackColor,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const TextStyle h1Bold = TextStyle(
      color: blackColor,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const TextStyle h2Normal = TextStyle(
      color: blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const TextStyle h2Bold = TextStyle(
      color: blackColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

//

  static const TextStyle headingWhite = TextStyle(
      color: whiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const TextStyle headingBlack = TextStyle(
      color: blackColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const TextStyle headingBlackBold = TextStyle(
      color: blackColor,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      decoration: TextDecoration.none);

  static const TextStyle headingWhiteBold = TextStyle(
      color: whiteColor,
      fontSize: 15,
      fontWeight: FontWeight.w800,
      decoration: TextDecoration.none);

  static const TextStyle subHeadingWhite = TextStyle(
      color: lightWhiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const TextStyle subHeadingBlack = TextStyle(
      color: blackColor,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.none);

  static const TextStyle subHeadingWhiteBold = TextStyle(
      color: whiteColor,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const TextStyle subHeadingBlackBold = TextStyle(
      color: blackColor,
      fontSize: 12,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none);

  static const Widget height5 = SizedBox(
    height: 5,
  );
  static const Widget height10 = SizedBox(
    height: 10,
  );
  static const Widget height20 = SizedBox(
    height: 20,
  );
  static const Widget width5 = SizedBox(
    width: 5,
  );
  static const Widget width10 = SizedBox(
    width: 10,
  );
  static const Widget width20 = SizedBox(
    width: 20,
  );
}
