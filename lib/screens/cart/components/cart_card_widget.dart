import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/screens/product_detail_screen.dart';

import 'package:snkr_app/common/widgets/prefix_icon_button.dart';
import 'package:snkr_app/model/cart_model.dart';
import 'package:snkr_app/provider/favorite_provider.dart';
import 'package:snkr_app/utils/contants.dart';

class CartCard extends StatelessWidget {
  int quantity;
  Cart cartItem;
  VoidCallback onDecrease;
  VoidCallback onIncrease;
  VoidCallback onRemove;
  CartCard({
    super.key,
    required this.quantity,
    required this.cartItem,
    required this.onDecrease,
    required this.onIncrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppConstants.whiteColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                                productId: 1,
                                product: cartItem.product,
                                similarProducts: [],
                              )));
                },
                child: SizedBox(
                  height: 160,
                  width: MediaQuery.of(context).size.width * 0.32,
                  child: Stack(clipBehavior: Clip.none, children: [
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
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS860RVbXV4WSXukekwqA8etvpjMi64wPJLitHAOiNB6e0nFtacvStbdsbXPqVjekMXGp4&usqp=CAU"),
                              fit: BoxFit.cover)),
                    ),
                    Consumer<FavoriteProvider>(
                        builder: (context, value, child) {
                      bool hasMatch = value.hasMatch(product: cartItem.product);
                      return GestureDetector(
                        onTap: () {
                          hasMatch
                              ? Provider.of<FavoriteProvider>(context,
                                      listen: false)
                                  .removeProduct(context,
                                      product: cartItem.product)
                              : Provider.of<FavoriteProvider>(context,
                                      listen: false)
                                  .addProduct(context,
                                      product: cartItem.product);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10),
                            child: Icon(
                              hasMatch
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: AppConstants.blackColor,
                              size: 24,
                            ),
                          ),
                        ),
                      );
                    }),
                  ]),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProductDetailScreen(
                        //               productId: 1,
                        //               product: Product.emptyProduct,
                        //               similarProducts: [],
                        //             )));
                      },
                      child: Text(
                        cartItem.product.title,
                        // "ON RUNNING CLOUD X 3 AD MEN'S SHOES",
                        style: AppConstants.h1Normal.copyWith(
                          fontSize: 15,
                          // fontWeight: FontWeight.w500,
                          wordSpacing: 1,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cartItem.product.brandName,
                      // "On Running",
                      style: AppConstants.h2Normal.copyWith(
                        fontSize: 14,
                        color: AppConstants.secondaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Size : 8",
                      style: AppConstants.h1Normal.copyWith(
                          color: AppConstants.secondaryColor, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    // Text(
                    //   "14.040 KWD",
                    //   style: AppConstants.subHeadingBlackBold.copyWith(
                    //     color: AppConstants.blackColor,
                    //     fontSize: 14,
                    //     letterSpacing: 1,
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "KWD ${(cartItem.quantity * (cartItem.product.price - (cartItem.product.price * (cartItem.product.discount / 100)))).toStringAsFixed(3)}",
                          // "KWD 99.000",
                          style: cartItem.product.hasDiscount
                              ? AppConstants.h1Normal.copyWith(
                                  color: AppConstants.orangeColor, fontSize: 13)
                              : AppConstants.headingBlack.copyWith(
                                  color: AppConstants.blackColor, fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        cartItem.product.hasDiscount
                            ? Text(
                                "KWD ${(cartItem.quantity * cartItem.product.price).toStringAsFixed(3)}",
                                // "KWD 109.000",
                                style: AppConstants.h2Normal.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              )
                            : const SizedBox.shrink()
                      ],
                    ),

                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: onDecrease,
                                child: Container(
                                  height: 22,
                                  width: 30,
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppConstants.blackColor),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(3),
                                          topLeft: Radius.circular(3))),
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color:
                                          //  cartItem.quantity > 1
                                          //     ?
                                          AppConstants.blackColor,
                                      // : AppConstants.whiteColor,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 22,
                                width: 30,
                                // padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppConstants.blackColor),
                                ),
                                child: Center(
                                    child: Text(
                                  quantity.toString(),
                                  style: AppConstants.subHeadingBlack
                                      .copyWith(color: AppConstants.blackColor),
                                )),
                              ),
                              GestureDetector(
                                onTap: onIncrease,
                                child: Container(
                                  height: 22,
                                  width: 30,
                                  // padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppConstants.blackColor),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(3),
                                          bottomRight: Radius.circular(3))),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: AppConstants.blackColor,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          prefixIconButton(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.2,
                            context,
                            title: "Remove",
                            ontap: onRemove,
                            icon: const Icon(Icons.delete_outline_outlined,
                                size: 20, color: AppConstants.blackColor),
                            bgColor: AppConstants.whiteColor,
                            titleStyle: AppConstants.h2Normal.copyWith(
                                color: AppConstants.lightBlackColor,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
