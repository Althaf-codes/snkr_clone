import 'package:flutter/material.dart';
import 'package:snkr_app/utils/contants.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                color: AppConstants.whiteColor,
                image: DecorationImage(
                    image: AssetImage(AppConstants.emptyCartLogo),
                    fit: BoxFit.cover)),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Cart is empty",
          style: AppConstants.h1Bold
              .copyWith(fontSize: 32, letterSpacing: 1, wordSpacing: 1),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Please add item to the cart",
          style: AppConstants.h1Normal.copyWith(wordSpacing: 1, fontSize: 22),
        )
      ],
    );
  }
}
