import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget comingSoonCard() {
  return Container(
    height: 355,
    width: 200,
    decoration: BoxDecoration(
        color: AppConstants.whiteColor,
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        SizedBox(
          height: 180,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: AppConstants.whiteColor,
                    borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                        scale: 0.5,
                        image: NetworkImage(
                            "https://images.pexels.com/photos/1456733/pexels-photo-1456733.jpeg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  height: 40,
                  width: 45,
                  clipBehavior: Clip.hardEdge,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: AppConstants.whiteColor,
                    borderRadius: const BorderRadius.only(
                        // topRight: Radius.circular(30),
                        bottomRight: Radius.circular(35)),
                    // image: DecorationImage(
                    //     image: NetworkImage(
                    //         "https://upload.wikimedia.org/wikipedia/en/thumb/3/37/Jumpman_logo.svg/800px-Jumpman_logo.svg.png"),
                    //     fit: BoxFit.cover),
                  ),
                  child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/en/thumb/3/37/Jumpman_logo.svg/800px-Jumpman_logo.svg.png",
                    fit: BoxFit.cover,
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "09",
                            style: AppConstants.h1Bold.copyWith(
                                color: AppConstants.whiteColor, fontSize: 12),
                          ),
                          Text("NOV",
                              style: AppConstants.subHeadingWhiteBold
                                  .copyWith(fontSize: 8)),
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Air Jordan 4",
                // product.brandName, //"Biosline",
                style: AppConstants.h1Normal.copyWith(
                    color: AppConstants.grayColor,
                    letterSpacing: 1,
                    fontSize: 16),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "Sea Salt Astro",
                // product.title, //"Biosline Omega 3/6 60Sg Cap",
                style: AppConstants.h1Bold.copyWith(
                  color: AppConstants.secondaryColor,
                  fontSize: 15,
                ),

                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              // const SizedBox(
              //   height: 6,
              // ),
            ],
          ),
        )
      ],
    ),
  );
}
