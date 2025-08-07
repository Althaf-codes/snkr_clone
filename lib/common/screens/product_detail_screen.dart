import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/border_button.dart';
import 'package:snkr_app/common/widgets/payment_gateway_banner.dart';
import 'package:snkr_app/common/widgets/prefix_icon_button.dart';
import 'package:snkr_app/common/widgets/related_product_section.dart';
import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/model/size_guide_model.dart';
import 'package:snkr_app/provider/bottom_nav_provider.dart';
import 'package:snkr_app/provider/cart_provider.dart';
import 'package:snkr_app/provider/favorite_provider.dart';
import 'package:snkr_app/utils/contants.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;
  final Product product;
  final List<Product> similarProducts;
  const ProductDetailScreen({
    super.key,
    required this.productId,
    required this.product,
    required this.similarProducts,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ScrollController _scrollController;
  late ScrollController _imgScrollController;
  int _currentIndex = 0;
  int _selectedSizeIndex = 0;
  // List<SizeGuide> allShoeSizes = [
  //   SizeGuide(country: "US", sizes: [
  //     Size(size: "7", id: '1345', totalStock: 0),
  //     Size(size: "7.5", id: '1234', totalStock: 0),
  //     Size(size: "8", id: '5678', totalStock: 56), // Random value
  //     Size(size: "8.5", id: '9101', totalStock: 72), // Random value
  //     Size(size: "9", id: '1123', totalStock: 35), // Random value
  //     Size(size: "10", id: '1415', totalStock: 18), // Random value
  //     Size(size: "10.5", id: '1617', totalStock: 0),
  //     Size(size: "11", id: '1819', totalStock: 49), // Random value
  //     Size(size: "11.5", id: '2021', totalStock: 0),
  //     Size(size: "12", id: '2223', totalStock: 0),
  //     Size(size: "13", id: '2425', totalStock: 0),
  //   ]),
  //   SizeGuide(country: "UK", sizes: [
  //     Size(size: "6", id: '3001', totalStock: 0),
  //     Size(size: "6.5", id: '3002', totalStock: 0),
  //     Size(size: "7", id: '3003', totalStock: 43), // Random value
  //     Size(size: "7.5", id: '3004', totalStock: 27), // Random value
  //     Size(size: "8", id: '3005', totalStock: 62), // Random value
  //     Size(size: "9", id: '3006', totalStock: 78), // Random value
  //     Size(size: "9.5", id: '3007', totalStock: 0),
  //     Size(size: "10", id: '3008', totalStock: 25), // Random value
  //     Size(size: "10.5", id: '3009', totalStock: 0),
  //     Size(size: "11", id: '3010', totalStock: 0),
  //     Size(size: "12", id: '3011', totalStock: 0),
  //   ]),
  //   SizeGuide(country: "EU", sizes: [
  //     Size(size: "40", id: '4001', totalStock: 0),
  //     Size(size: "40.5", id: '4002', totalStock: 0),
  //     Size(size: "41", id: '4003', totalStock: 50), // Random value
  //     Size(size: "42", id: '4004', totalStock: 65), // Random value
  //     Size(size: "42.5", id: '4005', totalStock: 33), // Random value
  //     Size(size: "44", id: '4006', totalStock: 84), // Random value
  //     Size(size: "44.5", id: '4007', totalStock: 0),
  //     Size(size: "45", id: '4008', totalStock: 29), // Random value
  //     Size(size: "45.5", id: '4009', totalStock: 0),
  //     Size(size: "46", id: '4010', totalStock: 0),
  //     Size(size: "47.5", id: '4011', totalStock: 0),
  //   ]),
  // ];

  @override
  void initState() {
    _scrollController = ScrollController();
    _imgScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _imgScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  shrinkWrap: true,
                  controller: _scrollController,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 26,
                              color: AppConstants.blackColor,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // if (GoRouter.of(context).canPop()) {
                              //   context.pop();
                              // } else {
                              //   context.go(
                              //       '/home'); // or any other fallback route
                              // }
                            },
                          ),
                        ),
                        const Spacer(),
                        Consumer<FavoriteProvider>(
                            builder: (context, value, child) {
                          bool hasMatch =
                              value.hasMatch(product: widget.product);

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                                onPressed: () {
                                  hasMatch
                                      ? Provider.of<FavoriteProvider>(context,
                                              listen: false)
                                          .removeProduct(context,
                                              product: widget.product)
                                      : Provider.of<FavoriteProvider>(context,
                                              listen: false)
                                          .addProduct(context,
                                              product: widget.product);
                                },
                                icon: Icon(
                                  hasMatch
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: AppConstants.blackColor,
                                  size: 28,
                                )),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share_outlined,
                                color: AppConstants.blackColor,
                                size: 30,
                              )),
                        ),
                      ],
                    ),
                    Container(
                      height: 400,
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              alignment: Alignment.center,
                              image: NetworkImage(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS860RVbXV4WSXukekwqA8etvpjMi64wPJLitHAOiNB6e0nFtacvStbdsbXPqVjekMXGp4&usqp=CAU"),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      // color: Colors.blue,
                      child: ListView.builder(
                          controller: _imgScrollController,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: _currentIndex == index
                                        ? Border.all(
                                            color: AppConstants.lightBlackColor)
                                        : Border.all(style: BorderStyle.none),
                                  ),
                                  child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS860RVbXV4WSXukekwqA8etvpjMi64wPJLitHAOiNB6e0nFtacvStbdsbXPqVjekMXGp4&usqp=CAU",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.product.brandName,
                          // "Nike",
                          style: AppConstants.headingBlackBold.copyWith(
                              color: AppConstants.blackColor,
                              fontSize: 20,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),

                        //CUSTOMIZE THIS BASED ON DISCOUNT,NEW ,SALE(11% EXTRA, ONLINE EXCLUSIVE) AND NO DISCOUNT and change color accordingly
                        widget.product.onSale ||
                                widget.product.isNew ||
                                widget.product.hasDiscount
                            ? Container(
                                height: 25,
                                // width: 45,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    color:
                                        //  widget.product.hasDiscount
                                        // ? Colors.red:
                                        Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              //  widget.product.hasDiscount
                                              // ? Colors.red[900]!:
                                              Colors.grey[300]!,
                                          offset: const Offset(-1.5, 1.5)),
                                      const BoxShadow(
                                          color: Colors.white60,
                                          offset: Offset(1.5, -1.5))
                                    ]),
                                child: widget.product.onSale
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                widget.product.discountTagline,
                                                style: AppConstants.h2Normal
                                                    .copyWith(
                                                        color: AppConstants
                                                            .whiteColor,
                                                        fontSize: 10),
                                              ),
                                            ),
                                          ])
                                    : widget.product.hasDiscount
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Text(
                                                  // "Extra 11% OFF CHECKOUT",
                                                  widget.product.discount
                                                      .toString(),
                                                  style: AppConstants.h2Normal
                                                      .copyWith(
                                                          color: AppConstants
                                                              .whiteColor,
                                                          fontSize: 10),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Text(
                                                  "%",
                                                  style: AppConstants.h1Normal
                                                      .copyWith(
                                                          color: AppConstants
                                                              .whiteColor,
                                                          fontSize: 12),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Center(
                                            child: Text(
                                              "NEW",
                                              style: AppConstants
                                                  .subHeadingWhite
                                                  .copyWith(
                                                color: AppConstants.whiteColor,
                                              ),
                                            ),
                                          ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.product.title,
                      // "Air Jordan 4 ${"military Blue"} Men's Shoe",
                      style: AppConstants.h1Normal.copyWith(
                        // fontWeight: FontWeight.w900,
                        letterSpacing: 1,
                        fontSize: 18,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        widget.product.hasDiscount
                            ? Text(
                                "KWD ${(widget.product.price - (widget.product.price * (widget.product.discount / 100))).toStringAsFixed(3)}",
                                // "KWD 87.000",
                                style: AppConstants.headingBlack.copyWith(
                                    color:
                                        const Color.fromARGB(255, 211, 119, 13),
                                    fontSize: 15),
                              )
                            : const SizedBox.shrink(),
                        widget.product.hasDiscount
                            ? const SizedBox(
                                width: 20,
                              )
                            : const SizedBox.shrink(),
                        Text(
                          "KWD ${widget.product.price.toStringAsFixed(3)}",
                          // "KWD 100.000",
                          style: widget.product.hasDiscount
                              ? AppConstants.headingBlack.copyWith(fontSize: 13)
                              : AppConstants.subHeadingBlack.copyWith(
                                  fontSize: 15,
                                  color: AppConstants.blackColor,
                                  decoration: widget.product.hasDiscount
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Color :", //"SKU : 3043632",
                          style: AppConstants.headingBlackBold.copyWith(
                              color: AppConstants.blackColor,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.product.color,
                          // "OFF WHITEMILITARY BLUE-NEUTRAL",

                          style: AppConstants.h1Normal.copyWith(
                              fontSize: 15,
                              color: AppConstants.blackColor,
                              letterSpacing: 1),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    paymentGatewayBanner(context,
                        content: "or 4 interest-free payments of",
                        discountedAmount: 20.750,
                        imgUrl: AppConstants.tabbyLogo,
                        hasLink: true,
                        linkName: ". Learn more",
                        url: ""),
                    const SizedBox(
                      height: 10,
                    ),
                    paymentGatewayBanner(context,
                        content: "or split into 4 payments of",
                        discountedAmount: 20.750,
                        imgUrl: AppConstants.tamaraLogo,
                        hasSuffixContent: true,
                        suffixContent: " interest-free with no late fees"),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        borderButton(
                            height: 40,
                            width: 150,
                            label: "Size Guide",
                            hasIcon: false,
                            ontap: () {}),
                        const Spacer()
                      ],
                    ),
                    AppConstants.height20,
                    _buildTabBar(
                        sizes: widget.product.sizes
                            .map((e) => e.country)
                            .toList()),
                    AppConstants.height10,
                    _buildTabContent(widget.product.sizes),
                    AppConstants.height20,
                    Divider(
                      height: 10,
                      color: Colors.grey[300],
                      thickness: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ExpansionTile(
                        shape: const RoundedRectangleBorder(),
                        tilePadding: const EdgeInsets.only(left: 4),
                        backgroundColor: AppConstants.whiteColor,
                        collapsedBackgroundColor: AppConstants.whiteColor,
                        title: Text(
                          "Description",
                          style: AppConstants.h1Normal
                              .copyWith(fontSize: 16, letterSpacing: 1),
                          textAlign: TextAlign.start,
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12),
                            child: MarkdownBody(data: widget.product.description
                                //                          '''
                                // **About the product**
                                // A limited edition skincare set featuring essential products for radiant skin.

                                // **Description**
                                // Includes a cleanser, toner, and moisturizer with nourishing ingredients.

                                // **How to Use**
                                // Apply the cleanser to damp skin, rinse, and follow up with toner and moisturizer.

                                // **Benefits**
                                // - Hydrates skin deeply
                                // - Reduces redness
                                // - Brightens complexion
                                //     '''
                                ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                "SKU :", //"SKU : 3043632",
                                style: AppConstants.headingBlackBold.copyWith(
                                    color: AppConstants.blackColor,
                                    fontSize: 15,
                                    letterSpacing: 1),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.product.sku,
                                // "FV5029-141",
                                style: AppConstants.h1Normal.copyWith(
                                    color: AppConstants.blackColor,
                                    fontSize: 14,
                                    letterSpacing: 1),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppConstants.height10,
                    RelatedProductSection(
                      title: 'Related Products',
                      similarProducts: widget.similarProducts,
                      // similarProducts: [],
                    ),
                    AppConstants.height10,
                    RelatedProductSection(
                      title: 'You May Also Like',
                      similarProducts: widget.similarProducts,
                      // similarProducts: [],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              // height: 70,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    prefixIconButton(
                      height: 45,
                      // width: MediaQuery.of(context).size.width * 0.2,
                      width: 100,
                      context,
                      title: "Buy Now",
                      ontap: () {},
                      icon: const Icon(Icons.shopping_bag_outlined,
                          size: 20, color: AppConstants.whiteColor),
                      bgColor: AppConstants.blackColor,
                      titleStyle: AppConstants.h1Normal.copyWith(
                          color: AppConstants.whiteColor,
                          fontWeight: FontWeight.w300,
                          fontSize: 13),
                    ),
                    AppConstants.width20,
                    Consumer<CartProvider>(builder: (context, value, child) {
                      bool containsProduct =
                          value.containsProduct(widget.product);

                      return borderButton(
                          height: 45,
                          width: MediaQuery.of(context).size.width * 0.45,
                          label: containsProduct ? "Go to Cart" : "Add to Cart",
                          hasIcon: true,
                          icon: Icons.shopping_cart_outlined,
                          ontap: () {
                            containsProduct
                                ? Provider.of<BottomNavProvider>(context,
                                        listen: false)
                                    .setIndex(3, context)
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const CartScreen()))

                                : value.addProduct(context,
                                    product: widget.product);
                          });
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar({required List<String> sizes}) {
    return SizedBox(
        height: 40,
        child: ListView(
            // controller: _scrollController2,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: [
              ...sizes.asMap().entries.map((ele) {
                int index = ele.key;
                return _buildTabItem2(index, ele.value);
              }),
            ]));
  }

  Widget _buildTabItem2(int index, String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSizeIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 50,
          width: _selectedSizeIndex == index ? 70 : 50,
          // padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: AppConstants.grayColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _selectedSizeIndex == index
                  ? const Icon(
                      Icons.check,
                      color: AppConstants.blackColor,
                    )
                  : const SizedBox.shrink(),
              Text(label,
                  style: AppConstants.h1Bold.copyWith(
                    color: AppConstants.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(List<SizeGuide> sizeGuides) {
    return IndexedStack(index: _selectedSizeIndex, children: [
      ...sizeGuides.map(
        (sizeGuide) {
          return Wrap(
            // direction: Axis.horizontal,
            children: [
              ...sizeGuide.sizes.map((shoeSize) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: shoeSize.size.length > 2 ? 100 : 50,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: AppConstants.grayColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            shoeSize.size.toString(),
                            style: AppConstants.h1Bold.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: shoeSize.totalStock > 0
                                    ? AppConstants.blackColor
                                    : AppConstants.grayColor),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          );
        },
      )
    ]);
  }
}
