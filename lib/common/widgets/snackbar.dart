import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height * 0.055,
            right: 20,
            left: 20),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppConstants.lightGrayColor,
        shape: const StadiumBorder(),
        content: Text(
          msg,
          style: const TextStyle(color: AppConstants.blackColor),
        )));
}
