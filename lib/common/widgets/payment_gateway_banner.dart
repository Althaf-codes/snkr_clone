import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

Widget paymentGatewayBanner(
  BuildContext context, {
  required String content,
  required double discountedAmount,
  required String imgUrl,
  String linkName = "",
  bool hasLink = false,
  String suffixContent = "",
  bool hasSuffixContent = false,
  String url = "",
}) {
  return Container(
    height: 100,
    decoration: BoxDecoration(
        border: Border.all(color: AppConstants.grayColor),
        borderRadius: BorderRadius.circular(4)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          height: 100,
          width: MediaQuery.of(context).size.width * 0.6,
          child: RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: content,
                style: AppConstants.h1Normal.copyWith(fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                    text: ' ${discountedAmount.toStringAsFixed(3)} KWD',
                    style: AppConstants.h1Bold.copyWith(fontSize: 16),
                  ),
                  hasLink
                      ? TextSpan(
                          text: linkName,
                          style: AppConstants.h1Normal.copyWith(fontSize: 15),
                          recognizer: TapGestureRecognizer()..onTap = () {})
                      : const TextSpan(),
                  hasSuffixContent
                      ? TextSpan(
                          text: suffixContent,
                          style: AppConstants.h1Normal,
                        )
                      : const TextSpan()
                ]),
          ),
        ),
        // const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 0.0),
          child: SizedBox(
            height: 40,
            // width: 100,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    ),
  );
}
