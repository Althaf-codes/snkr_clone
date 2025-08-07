import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget menuListTile({required String title, required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/19090/pexels-photo.jpg"),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                title,
                style: AppConstants.h1Normal
                    .copyWith(fontSize: 18, letterSpacing: 1.5),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppConstants.blackColor,
                size: 18,
              ),
            ],
          ),
          AppConstants.height10,
          const Divider(
            height: 1,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          )
        ],
      ),
    ),
  );
}
