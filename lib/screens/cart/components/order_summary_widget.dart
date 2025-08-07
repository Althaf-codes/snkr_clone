import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget orderSummaryWidget(BuildContext context,
    {required double subtotal,
    required double discount,
    required double shippingCharge}) {
  return Container(
    // height: 300,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(
              Icons.newspaper_outlined,
              color: AppConstants.blackColor,
              size: 20,
              // size: 18,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Order Summary",
              style: AppConstants.h1Bold.copyWith(fontSize: 15),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        orderSummaryItem(title: "Subtotal", price: subtotal),
        orderSummaryItem(title: "Discount", price: discount),
        orderSummaryItem(title: "Shipping", price: shippingCharge),
        orderSummaryItem(
            title: "Subtotal with Discount",
            price: subtotal - discount + shippingCharge)
      ],
    ),
  );
}

Widget orderSummaryItem({required String title, required double price}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppConstants.h1Normal
              .copyWith(color: AppConstants.blackColor, fontSize: 14),
        ),
        Text(
          "${price.toStringAsFixed(3)} KWD",
          style: AppConstants.h1Normal.copyWith(
            color: AppConstants.blackColor,
            fontSize: 14,
            letterSpacing: 1,
          ),
        ),
      ],
    ),
  );
}
