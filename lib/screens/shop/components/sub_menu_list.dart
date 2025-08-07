import 'package:flutter/material.dart';
import 'package:snkr_app/common/screens/categorywise_product_screen.dart';
import 'package:snkr_app/model/sub_menu_model.dart';
import 'package:snkr_app/screens/shop/components/sub_menu_list_tile.dart';
import 'package:snkr_app/utils/contants.dart';

Widget subMenuList(BuildContext context,
    {required String menuTitle, required SubMenuModel submenu}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: AppConstants.lightGrayColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                submenu.title,
                style: AppConstants.h1Bold
                    .copyWith(fontSize: 16, letterSpacing: 1),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategorywiseProductsScreen(
                                title: menuTitle,
                                // showBrands: submenu.id != 1,
                                //if not from single brand then false
                                showDepartment: false,
                                departmentName: menuTitle,
                              )));
                },
                child: Text(
                  "View All >>",
                  style: AppConstants.h1Bold.copyWith(
                      decoration: TextDecoration.underline,
                      fontSize: 13,
                      letterSpacing: 0.5,
                      wordSpacing: 0.3,
                      height: 0.3),
                ),
              ),
            ],
          ),
        ),
        ...submenu.items.map((ele) {
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategorywiseProductsScreen(
                              title: ele.title,
                              showBrands: submenu.id != 1,
                              //if not from single brand then false
                              showDepartment: false,
                              departmentName: menuTitle,
                            )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: subMenuListTile(label: ele.title),
              ));
        })
      ],
    ),
  );
}
