import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/provider/bottom_nav_provider.dart';
import 'package:snkr_app/provider/cart_provider.dart';
import 'package:snkr_app/provider/drawer_provider.dart';

import 'package:snkr_app/utils/contants.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // late int _currentIndex;

  // final _tabs = [
  //   '/home',
  //   '/allcategory',
  //   '/cart',
  //   '/search',
  //   '/account',
  // ];

  // void onchange(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   // context.go(_tabs[index]);
  // }

  // final List<Widget> _screens = [
  //   const HomeScreen(),
  //   const ShopScreen(),
  //   const CalenderScreen(),
  //   const CartScreen(),
  //   const ProfileScreen(),
  // ];

  // double xOffset = 0;
  // double yOffset = 0;
  // double scaleFactor = 1;

  // bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavProvider, DrawerProvider>(
        builder: (context, bottomProvider, drawerProvider, child) {
      final currentIndex = bottomProvider.currentIndex;
      bool isDrawerOpen = drawerProvider.isDrawerOpen;
      return Stack(
        children: [
          isDrawerOpen
              ? AnimatedPositioned(
                  top: isDrawerOpen
                      ? MediaQuery.of(context).size.height * 0.183
                      : 0,
                  left: isDrawerOpen
                      ? MediaQuery.of(context).size.width * 0.55
                      : 0,
                  // right:
                  //     isDrawerOpen ? MediaQuery.of(context).size.width * 0.09 : 0,
                  duration: const Duration(milliseconds: 30),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.69, //0.69,
                    width: MediaQuery.of(context).size.width * 0.3,
                    // 150,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(30))),
                  ),
                )
              : const SizedBox.shrink(),
          isDrawerOpen
              ? AnimatedPositioned(
                  top: isDrawerOpen
                      ? MediaQuery.of(context).size.height * 0.2
                      : 0,
                  // right:
                  //     isDrawerOpen ? MediaQuery.of(context).size.width * 0.12 : 0,
                  left: isDrawerOpen
                      ? MediaQuery.of(context).size.width * 0.52
                      : 0,
                  duration: const Duration(milliseconds: 350),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65, //0.65,
                    width: MediaQuery.of(context).size.width * 0.3,
                    // 150,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.25),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(30))),
                  ),
                )
              : const SizedBox.shrink(),
          AnimatedContainer(
            transform: Matrix4.translationValues(
                drawerProvider.xOffset, drawerProvider.yOffset, 0)
              ..scale(drawerProvider.scaleFactor)
              ..rotateY(isDrawerOpen ? -0.5 : 0),
            duration: const Duration(milliseconds: 250),
            decoration: BoxDecoration(
                color: AppConstants.blackColor,
                borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0),
                boxShadow: const []),
            child: Column(
              children: [
                Expanded(
                    child: customContainer(context, child: widget.child
                        //  _screens[_currentIndex]
                        )),
                IgnorePointer(
                  ignoring: isDrawerOpen,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(30))),
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (int i = 0; i < 5; i++)
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => bottomProvider.setIndex(i, context),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: currentIndex == i ? 20 : 0,
                              ),
                              decoration: currentIndex == i
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: Colors.white),
                                    )
                                  : null,
                              child: Row(
                                children: [
                                  i == 3
                                      ? Consumer<CartProvider>(
                                          builder: (context, value, child) {
                                          if (value.cartProduct.isNotEmpty) {
                                            return Badge.count(
                                              alignment: Alignment.topRight,
                                              count: value.cartProduct.length,
                                              backgroundColor:
                                                  AppConstants.orangeColor,
                                              // offset: const Offset(8, -8),
                                              textStyle:
                                                  AppConstants.subHeadingWhite,
                                              child: Icon(
                                                Icons.shopping_cart_outlined,
                                                size: 24,
                                                color: currentIndex == 3
                                                    ? AppConstants.whiteColor
                                                    : AppConstants.grayColor,
                                              ),
                                            );
                                          } else {
                                            return Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 24,
                                              color: currentIndex == 3
                                                  ? AppConstants.whiteColor
                                                  : AppConstants.grayColor,
                                            );
                                          }
                                        })
                                      : Icon(
                                          _getIcon(i),
                                          size: i == 0 ? 26 : 24,
                                          color: currentIndex == i
                                              ? AppConstants.whiteColor
                                              : AppConstants.grayColor,
                                        ),
                                  const SizedBox(width: 5),
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 300),
                                    child: currentIndex == i
                                        ? Text(
                                            _getLabel(i),
                                            key: ValueKey<String>(_getLabel(i)),
                                            style: const TextStyle(
                                                color: AppConstants.whiteColor),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget badgeIcon(int currentIndex) {
    return Consumer<CartProvider>(builder: (context, value, child) {
      if (value.cartProduct.isNotEmpty) {
        return Badge.count(
          alignment: Alignment.topRight,
          count: value.cartProduct.length,
          backgroundColor: AppConstants.orangeColor,
          // offset: const Offset(8, -8),
          textStyle: AppConstants.subHeadingWhite,
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 26,
            color: currentIndex == 3
                ? AppConstants.whiteColor
                : AppConstants.grayColor,
          ),
        );
      } else {
        return Icon(
          Icons.shopping_cart_outlined,
          size: 26,
          color: currentIndex == 3
              ? AppConstants.whiteColor
              : AppConstants.grayColor,
        );
      }
    });
  }
  /*
  
  Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        color: Colors.black,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => onchange(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: _currentIndex == i ? 20 : 0,
                  ),
                  decoration: _currentIndex == i
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                        )
                      : null,
                  child: Row(
                    children: [
                      Icon(
                        _getIcon(i),
                        size: i == 0 ? 26 : 24,
                        color: _currentIndex == i ? Colors.white : Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: _currentIndex == i
                            ? Text(
                                _getLabel(i),
                                key: ValueKey<String>(_getLabel(i)),
                                style: const TextStyle(color: Colors.white),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
 
  */

  IconData _getIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.shopping_bag_outlined;
      case 2:
        return Icons.calendar_month;
      case 3:
        return Icons.shopping_cart_outlined;
      case 4:
        return Icons.person_2_outlined;
      default:
        return Icons.home_outlined;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Shop";
      case 2:
        return "Calendar";
      case 3:
        return "Cart";
      case 4:
        return "Profile";
      default:
        return "Home";
    }
  }
}

/*
  BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined), label: "Category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: "Calender"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_outlined), label: "Profile"),

*/
