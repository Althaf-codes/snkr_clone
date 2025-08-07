// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/provider/drawer_provider.dart';

import 'package:snkr_app/utils/contants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(builder: (context, value, child) {
      bool isDrawerOpen = value.isDrawerOpen;
      return AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leadingWidth: 150,
        backgroundColor: AppConstants.whiteColor,
        leading: Row(
          children: [
            IconButton(
              color: AppConstants.whiteColor,
              onPressed: () {
                if (isDrawerOpen) {
                  value.closeDrawer();
                } else {
                  value.openDrawer();
                }
              },
              icon: Icon(
                  isDrawerOpen ? Icons.arrow_back_ios_new_outlined : Icons.menu,
                  size: 28,
                  color: AppConstants.blackColor),
            ),
            Image.asset(
              AppConstants.logo,
              // height: 100,
              // width: 50,
              fit: BoxFit.cover,
            )
          ],
        ),
        title: Text(
          "KWD",
          style: AppConstants.h1Normal.copyWith(letterSpacing: 1),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 28,
                color: AppConstants.blackColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 28,
                color: AppConstants.blackColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                size: 26,
                color: AppConstants.blackColor,
              )),
        ],
      );
    });
  }
}
