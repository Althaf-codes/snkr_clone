import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget subMenuListTile({required String label}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: AppConstants.h1Normal.copyWith(fontSize: 18),
      ),
      const Icon(
        Icons.arrow_forward_ios_outlined,
        color: AppConstants.blackColor,
        size: 18,
      )
    ],
  );
}
