import 'package:flutter/material.dart';

Widget prefixIconButton(BuildContext context,
    {required String title,
    required VoidCallback ontap,
    required double height,
    required double width,
    required Color bgColor,
    bool hasIcon = true,
    Icon? icon,
    required TextStyle titleStyle}) {
  return Expanded(
    child: GestureDetector(
      onTap: ontap,
      child: Container(
          height: height,
          // width: width,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasIcon ? icon! : const SizedBox.shrink(),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: titleStyle,
              ),
            ],
          )),
    ),
  );
}
