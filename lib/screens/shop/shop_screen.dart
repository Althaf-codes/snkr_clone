import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/data/app_data.dart';
import 'package:snkr_app/common/screens/categorywise_product_screen.dart';
import 'package:snkr_app/common/widgets/custom_appbar.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/common/widgets/menu_list_tile.dart';
import 'package:snkr_app/provider/drawer_provider.dart';
import 'package:snkr_app/screens/shop/components/all_brand_screen.dart';
import 'package:snkr_app/screens/shop/components/sub_menu_screen.dart';
import 'package:snkr_app/utils/contants.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 60),
            child: const CustomAppbar()),
        body: Consumer<DrawerProvider>(builder: (context, value, child) {
          bool isDrawerOpen = value.isDrawerOpen;
          return IgnorePointer(
            ignoring: isDrawerOpen,
            child: customContainer(
              context,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    AppConstants.height20,
                    _buildTabBar(allBrands: AppData().allBrands),
                    AppConstants.height20,
                    ...AppData().allDepartment.entries.map((e) {
                      return menuListTile(
                          title: e.key,
                          ontap: () {
                            if (e.key == "New Arrivals") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategorywiseProductsScreen(
                                              showAll: true, title: e.key)));
                            } else if (e.key == "Sale") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategorywiseProductsScreen(
                                              showAll: true, title: e.key)));
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SubMenuScreen(
                                          title: e.key, submenu: e.value)));
                            }
                          });
                    })
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Widget _buildTabBar({required List<String> allBrands}) {
    return SizedBox(
      height: 40,
      child: ListView(
        // controller: _scrollController2,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          ...allBrands.asMap().entries.map((ele) {
            int index = ele.key;

            // If it's the first 9 elements, return _buildTabItem
            if (index < 9) {
              return _buildTabItem(index, ele.value);
            } else if (index == 9) {
              return _buildTabItem(index, "View all");
            } else {
              return SizedBox.shrink();
            }
          }).take(10)

          //  ...for(int i=0; i<9;i++){
          //     _buildTabItem(i, _allBrands[index]);
          //   }.toList(),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    return InkWell(
      onTap: () {
        if (index == 9) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AllBrandScreen(items: AppData().allBrands)));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategorywiseProductsScreen(
                        title: label,
                        showBrands: false,
                        showAll: true,
                      )));
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          // height: 60,
          // margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppConstants.lightGrayColor,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(label,
                style: index == 9
                    ? AppConstants.h1Bold.copyWith(
                        color: AppConstants.blackColor,
                        fontSize: 15,
                        letterSpacing: 0.5,
                        wordSpacing: 0.5,
                        height: 0.5,
                        decoration: TextDecoration.underline)
                    : AppConstants.h1Normal.copyWith(
                        fontSize: 15,
                        color: AppConstants.blackColor,
                        letterSpacing: 1)),
          ),
        ),
      ),
    );
  }
}
