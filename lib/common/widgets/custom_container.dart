import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget customContainer(BuildContext context,
    {required Widget child, Color color = AppConstants.whiteColor}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.85,
    width: MediaQuery.of(context).size.width,
    clipBehavior: Clip.hardEdge,
    // padding: EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
    child: child,
  );
}
