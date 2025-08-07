import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/data/app_data.dart';
import 'package:snkr_app/model/drawer_model.dart';
import 'package:snkr_app/provider/bottom_nav_provider.dart';
import 'package:snkr_app/provider/drawer_provider.dart';
import 'package:snkr_app/utils/contants.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  // final Map<String, IconData> _drawerItems = {
  //   "Home": Icons.home_outlined,
  //   "Shop": Icons.shopping_bag_outlined,
  //   "Calendar": Icons.calendar_month,
  //   "Cart": Icons.shopping_cart_outlined,
  //   "Profile": Icons.person_2_outlined,
  //   "Login": Icons.login_outlined,
  // };

  final List<DrawerItem> _drawerItems = [
    DrawerItem(name: "Home", id: 0, icon: Icons.home_outlined),
    DrawerItem(name: "Shop", id: 1, icon: Icons.shopping_bag_outlined),
    DrawerItem(name: "Calendar", id: 2, icon: Icons.calendar_month),
    DrawerItem(name: "Cart", id: 3, icon: Icons.shopping_cart_outlined),
    DrawerItem(name: "Profile", id: 4, icon: Icons.person_2_outlined),
    DrawerItem(name: "Login", id: 0, icon: Icons.login_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: AppConstants.whiteColor,
      padding: const EdgeInsets.only(top: 50, bottom: 70, left: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppConstants.logo), fit: BoxFit.cover)),
            ),
            Column(children: [
              ..._drawerItems.map(
                (item) => InkWell(
                  onTap: () {
                    Provider.of<BottomNavProvider>(context, listen: false)
                        .setIndex(item.id, context);
                    Provider.of<DrawerProvider>(context, listen: false)
                        .closeDrawer();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: Row(
                      children: [
                        Icon(
                          item.icon,
                          color: AppConstants.lightBlackColor,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(item.name,
                            style: AppConstants.h1Normal.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1))
                      ],
                    ),
                  ),
                ),
              )
            ]),
            ...AppData().allDepartment.entries.map((department) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.52,
                child: ExpansionTile(
                  shape: const RoundedRectangleBorder(),
                  iconColor: AppConstants.blackColor,
                  showTrailingIcon: true,
                  title: Text(
                    department.key,
                    style: AppConstants.h1Normal.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
                  children: [
                    ...department.value.map((submenu) {
                      return ExpansionTile(
                        iconColor: AppConstants.blackColor,
                        showTrailingIcon: true,
                        title: Text(
                          submenu.title,
                          style: AppConstants.h1Normal.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1),
                        ),
                        children: submenu.items
                            .map((brand) => ListTile(
                                  title: Text(
                                    brand.title,
                                    style: AppConstants.h1Normal.copyWith(
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1),
                                  ),
                                ))
                            .toList(),
                      );
                    }),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
