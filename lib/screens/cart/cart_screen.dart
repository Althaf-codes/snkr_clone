import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/custom_appbar.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/model/cart_model.dart';
import 'package:snkr_app/provider/cart_provider.dart';
import 'package:snkr_app/provider/drawer_provider.dart';
import 'package:snkr_app/screens/cart/components/cart_card_widget.dart';
import 'package:snkr_app/screens/cart/components/empty_cart_screen.dart';
import 'package:snkr_app/screens/cart/components/order_summary_widget.dart';
import 'package:snkr_app/utils/contants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late ScrollController _scrollController;
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _scrollController = ScrollController();
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 60),
          child: const CustomAppbar()),
      body: Consumer2<DrawerProvider, CartProvider>(
          builder: (context, drawerProvider, cartProvider, child) {
        bool isDrawerOpen = drawerProvider.isDrawerOpen;

        List<Cart> cartItems = cartProvider.cartProduct;
        if (cartItems.isEmpty) {
          return IgnorePointer(
              ignoring: isDrawerOpen,
              child: customContainer(
                context,
                child: const EmptyCartScreen(),
              ));
        }
        final double subTotal = cartProvider.getTotalPrice();
        final double totaldiscounted =
            cartProvider.getTotalPriceAfterDiscount();
        const double shippingCharge = 0.400;
        return IgnorePointer(
          ignoring: isDrawerOpen,
          child: customContainer(
            context,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ...List.generate(
                        cartItems.length,
                        (index) => CartCard(
                              cartItem: cartItems[index],
                              quantity: cartItems[index].quantity,
                              onDecrease: () {
                                if (cartItems[index].quantity > 1) {
                                  cartProvider.decreaseQuantity(
                                      context, cartItems[index].product.id);
                                }
                              },
                              onIncrease: () {
                                cartProvider.increaseQuantity(
                                    cartItems[index].product.id);
                              },
                              onRemove: () {
                                cartProvider.removeProduct(context,
                                    productId: cartItems[index].product.id);
                              },
                            )),

                    // CartCard(
                    //     quantity: 2,
                    //     cartItem: [],
                    //     onDecrease: () {},
                    //     onIncrease: () {},
                    //     onRemove: () {}),
                    AppConstants.height10,
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppConstants.whiteColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 20),
                                Text(
                                  "%",
                                  style: AppConstants.h1Normal.copyWith(
                                    fontSize: 24,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  // height: 150,
                                  width:
                                      MediaQuery.of(context).size.width * 0.72,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Add a Coupon Code",
                                        style: AppConstants.h1Bold
                                            .copyWith(fontSize: 15),
                                      ),
                                      Text(
                                        "Avail offers and discounts on your order",
                                        style: AppConstants.subHeadingBlackBold
                                            .copyWith(
                                          fontSize: 13,
                                          color: Colors.green,
                                          letterSpacing: 1,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  // padding: const EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppConstants.lightBlackColor),
                                      color: AppConstants.whiteColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: TextField(
                                    // showCursor: true,

                                    style: const TextStyle(
                                      color: AppConstants.blackColor,
                                    ),
                                    onTap: () {},
                                    onChanged: (val) {},
                                    textAlign: TextAlign.justify,
                                    textAlignVertical: TextAlignVertical.top,
                                    controller: _textEditingController,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(
                                                color:
                                                    AppConstants.blackColor)),
                                        contentPadding: EdgeInsets.all(10),
                                        border: InputBorder.none,
                                        focusColor: Colors.transparent,
                                        alignLabelWithHint: true,
                                        hintText: 'Promo code',
                                        hintStyle: AppConstants.h1Normal
                                            .copyWith(fontSize: 13)
                                        // fontWeight: FontWeight.w600,

                                        ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      height: 40,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: AppConstants.blackColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Apply",
                                        style: AppConstants.h1Normal.copyWith(
                                            color: AppConstants.whiteColor,
                                            letterSpacing: 1,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppConstants.height10,
                    Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppConstants.whiteColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 15),
                                const Icon(
                                  Icons.card_giftcard_outlined,
                                  size: 20,
                                  color: AppConstants.blackColor,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Add a Gift Card Code",
                                  style: AppConstants.h1Bold
                                      .copyWith(fontSize: 15),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  // padding: const EdgeInsets.only(left: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppConstants.lightBlackColor),
                                      color: AppConstants.whiteColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8))),
                                  child: TextField(
                                    // showCursor: true,

                                    style: const TextStyle(
                                      color: AppConstants.blackColor,
                                    ),
                                    onTap: () {},
                                    onChanged: (val) {},
                                    textAlign: TextAlign.justify,
                                    textAlignVertical: TextAlignVertical.top,
                                    controller: _textEditingController,
                                    decoration: InputDecoration(
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)),
                                            borderSide: BorderSide(
                                                color:
                                                    AppConstants.blackColor)),
                                        contentPadding: EdgeInsets.all(10),
                                        border: InputBorder.none,
                                        focusColor: Colors.transparent,
                                        alignLabelWithHint: true,
                                        hintText: 'Gift card',
                                        hintStyle: AppConstants.h1Normal
                                            .copyWith(
                                                fontSize: 14, letterSpacing: 1)
                                        // fontWeight: FontWeight.w600,

                                        ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Center(
                                    child: Container(
                                      height: 45,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          color: AppConstants.blackColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Apply",
                                        style: AppConstants.h1Normal.copyWith(
                                            color: AppConstants.whiteColor,
                                            letterSpacing: 1,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppConstants.height10,

                    Container(
                      decoration: BoxDecoration(
                          color: AppConstants.whiteColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          orderSummaryWidget(context,
                              subtotal: subTotal,
                              // 99.000,
                              discount: subTotal - totaldiscounted,
                              //  10.000,
                              shippingCharge: shippingCharge
                              //2.000
                              ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Provider.of<BottomNavProvider>(context, listen: false)
                                    //     .setIndex(0, context);
                                  },
                                  child: Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppConstants.blackColor),
                                        borderRadius: BorderRadius.circular(8)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Continue Shopping",
                                      style: AppConstants.h1Normal.copyWith(
                                        color: AppConstants.blackColor,
                                        fontSize: 12,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // StripeService.instance.makePayment(
                                    //     context,
                                    //     (subTotal -
                                    //         (subTotal - totaldiscounted) +
                                    //         shippingCharge));
                                  },
                                  child: Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppConstants.blackColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Checkout",
                                      style: AppConstants.h1Normal.copyWith(
                                        color: AppConstants.whiteColor,
                                        fontSize: 12,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppConstants.height10,
                        ],
                      ),
                    ),

                    // const SizedBox(
                    //   height: 50,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
