import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget borderButton(
    {required double height,
    required double width,
    required String label,
    required bool hasIcon,
    IconData? icon,
    required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          // color: Colors.blue,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(4)),
      // padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hasIcon
              ? Icon(
                  icon,
                  size: 20,
                  color: AppConstants.blackColor,
                )
              : const SizedBox.shrink(),
          hasIcon ? AppConstants.width10 : const SizedBox.shrink(),
          Text(
            label,
            style: AppConstants.h1Normal
                .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
          )
        ],
      ),
    ),
  );
}
