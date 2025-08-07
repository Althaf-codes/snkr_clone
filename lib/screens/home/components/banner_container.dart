import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget bannerContainer(
    {required double height,
    required double width,
    required String imgUrl,
    required VoidCallback ontap}) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: AppConstants.lightGrayColor,
          image: DecorationImage(
              image: NetworkImage(
                imgUrl,
              ),
              fit: BoxFit.cover)),
    ),
  );
}
