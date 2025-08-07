import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget rafflesCard(BuildContext context, {required String productId}) {
  return Container(
    // height: MediaQuery.of(context).size.height * 0.6,
    width: MediaQuery.of(context).size.width * 0.95,
    // color: Colors.blue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jordan",
          style: AppConstants.h1Bold.copyWith(
              color: AppConstants.grayColor, fontSize: 17, letterSpacing: 1),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        AppConstants.height10,
        Text(
          "Air Jordan 1 Low OG 'MOCHA'",
          style: AppConstants.h1Bold.copyWith(
            fontSize: 15,
            letterSpacing: 1.5,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        AppConstants.height20,
        Hero(
          transitionOnUserGestures: true,
          tag: productId,
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1542291026-7eec264c27ff?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2hvZXxlbnwwfHwwfHx8MA%3D%3D"),
                    fit: BoxFit.cover)),
          ),
        ),
        AppConstants.height10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RAFFLE CLOSED",
                style: AppConstants.h1Bold.copyWith(
                  fontSize: 15,
                  letterSpacing: 1,
                ),
              ),
              Container(
                height: 50,
                width: 150,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: AppConstants.grayColor),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                  "KD 61.500",
                  style: AppConstants.h1Normal.copyWith(
                      letterSpacing: 1,
                      color: AppConstants.grayColor,
                      fontSize: 15),
                ),
              )
            ],
          ),
        ),
        AppConstants.height10
      ],
    ),
  );
}
