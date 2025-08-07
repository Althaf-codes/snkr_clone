import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snkr_app/common/widgets/custom_appbar.dart';
import 'package:snkr_app/common/widgets/custom_container.dart';
import 'package:snkr_app/common/widgets/partner_group_section.dart';
import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/provider/drawer_provider.dart';
import 'package:snkr_app/provider/product_provider.dart';
import 'package:snkr_app/screens/home/components/banner_container.dart';
import 'package:snkr_app/screens/home/components/product_group_section.dart';
import 'package:snkr_app/utils/contants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  List<Product> saleProducts = [];
  List<Product> asicsProducts = [];
  List<Product> nikeShoes = [];
  @override
  void initState() {
    _scrollController = ScrollController();

    saleProducts =
        Provider.of<ProductProvider>(context, listen: false).saleProducts;
    asicsProducts =
        Provider.of<ProductProvider>(context, listen: false).ascisProducts;
    nikeShoes = Provider.of<ProductProvider>(context, listen: false).nikeShoes;
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://www.shutterstock.com/shutterstock/photos/2145406947/display_1500/stock-photo-sale-off-extra-shop-now-sign-holographic-gradient-over-art-white-brush-strokes-acrylic-paint-on-2145406947.jpg",
                        ontap: () {}),
                    AppConstants.height20,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://cdn.venngage.com/template/thumbnail/full/a13c371d-71c4-436d-8193-2f9e18db2772.webp",
                        ontap: () {}),
                    AppConstants.height20,
                    ProductGroupSection(
                        title: "Extra 11% OFF", products: saleProducts),
                    AppConstants.height20,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://static01.nyt.com/images/2022/05/17/fashion/17STANLEY-BOTTLE1/17STANLEY-BOTTLE1-videoSixteenByNineJumbo1600.jpg",
                        ontap: () {}),
                    AppConstants.height20,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://mir-s3-cdn-cf.behance.net/project_modules/hd/61390c125542325.611b9b02d73dc.jpeg",
                        ontap: () {}),
                    AppConstants.height20,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://cdn.shopify.com/s/files/1/0732/1691/7807/files/tamara-english.jpg?v=1682590303",
                        ontap: () {}),
                    AppConstants.height10,
                    const PartnerGroupSection(),
                    AppConstants.height10,
                    ProductGroupSection(
                        title: "SHOP ASICS", products: asicsProducts),
                    AppConstants.height10,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://img.pikbest.com/origin/06/18/48/653pIkbEsTvdi.jpg!w700wp",
                        ontap: () {}),
                    AppConstants.height20,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/63b0a657792295.59e4652eb2e41.jpg",
                        ontap: () {}),
                    AppConstants.height20,
                    bannerContainer(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 0.95,
                        imgUrl:
                            "https://www.sneakerbaas.nl/cdn/shop/collections/newbalancebanner_320x320_crop_center.jpg?v=1712409908",
                        ontap: () {}),
                    AppConstants.height20,
                    ProductGroupSection(title: "NIKE", products: nikeShoes),
                    AppConstants.height20,
                    const ProductGroupSection(
                        title: "ACCESSORIES", products: []),
                    AppConstants.height10,
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
