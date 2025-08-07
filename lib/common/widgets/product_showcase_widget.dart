import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/provider/cart_provider.dart';
import 'package:snkr_app/provider/favorite_provider.dart';
import 'package:snkr_app/utils/contants.dart';

class ProductShowcaseWidget extends StatelessWidget {
  final Product product;
  final bool hasBadge;
  final int maxlines;

  const ProductShowcaseWidget({
    super.key,
    required this.product,
    this.hasBadge = false,
    this.maxlines = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 360,
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
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS860RVbXV4WSXukekwqA8etvpjMi64wPJLitHAOiNB6e0nFtacvStbdsbXPqVjekMXGp4&usqp=CAU"),
                          fit: BoxFit.cover)),
                ),
                hasBadge
                    ? Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                            height: 22,
                            // width: 40,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color:
                                    // product.isNew?
                                    AppConstants.blackColor,
                                // : Colors.red,
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(12))),
                            child: product.onSale
                                ? Center(
                                    child: Text(
                                      product
                                          .discountTagline, // "Extra 11% OFF CHECKOUT", //"NEW",
                                      style: AppConstants.subHeadingWhite
                                          .copyWith(
                                              color: AppConstants.whiteColor,
                                              fontSize: 10),
                                    ),
                                  )
                                : product.isNew
                                    ? Center(
                                        child: Text(
                                          "New",
                                          style: AppConstants.subHeadingWhite
                                              .copyWith(
                                            fontSize: 10,
                                            color: AppConstants.whiteColor,
                                          ),
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                              product.discount
                                                  .toInt()
                                                  .toString(),
                                              style: AppConstants.h2Bold
                                                  .copyWith(
                                                      color: AppConstants
                                                          .whiteColor,
                                                      fontSize: 9),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              "%",
                                              style: AppConstants.h1Bold
                                                  .copyWith(
                                                      color: AppConstants
                                                          .whiteColor,
                                                      fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      )),
                      )
                    : const SizedBox.shrink(),
                Consumer<FavoriteProvider>(builder: (context, value, child) {
                  bool hasMatch = value.hasMatch(product: product);

                  return GestureDetector(
                    onTap: () {
                      hasMatch
                          ? Provider.of<FavoriteProvider>(context,
                                  listen: false)
                              .removeProduct(context, product: product)
                          : Provider.of<FavoriteProvider>(context,
                                  listen: false)
                              .addProduct(context, product: product);
                    },
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 18, right: 18),
                        child: Icon(
                          hasMatch ? Icons.favorite : Icons.favorite_outline,
                          color: AppConstants.blackColor,
                          size: 24,
                        ),
                      ),
                    ),
                  );
                }),
                Consumer<CartProvider>(builder: (context, value, child) {
                  bool containsProduct = value.containsProduct(product);

                  return Positioned(
                    bottom: 0,
                    right: 20,
                    child: GestureDetector(
                      onTap: () {
                        containsProduct
                            ? value.removeProduct(context,
                                productId: product.id)
                            : value.addProduct(context, product: product);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        // padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppConstants.blackColor),
                        child: Center(
                          child: Icon(
                            containsProduct ? Icons.check : Icons.add,
                            size: containsProduct ? 20 : 24,
                            // Icons.add,
                            color: AppConstants.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  );
                })
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
                  product.brandName, // "NIKE",
                  style: AppConstants.h1Normal.copyWith(
                      color: AppConstants.blackColor,
                      letterSpacing: 1,
                      // fontSize: 18,
                      fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 40,
                  child: Text(
                    product.title, // "ON RUNNING CLOUD X 3 AD MEN'S SHOES",
                    style: AppConstants.subHeadingBlack.copyWith(
                      color: AppConstants.secondaryColor,
                      fontSize: 14,
                    ),

                    maxLines: maxlines,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                AppConstants.height5,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "KWD ${(product.price - (product.price * (product.discount / 100))).toStringAsFixed(3)}", // "KWD 63.000",
                      style: product.hasDiscount
                          ? AppConstants.headingBlack.copyWith(
                              color: AppConstants.orangeColor, fontSize: 13)
                          : AppConstants.headingBlack.copyWith(
                              color: AppConstants.secondaryColor, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    product.hasDiscount
                        ? Text(
                            "KWD ${product.price.toStringAsFixed(3)}",
                            // "KWD 80.000",
                            style: AppConstants.headingBlack.copyWith(
                                color: AppConstants.secondaryColor,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          )
                        : const SizedBox.shrink()
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
