import 'package:flutter/material.dart';
import 'package:snkr_app/common/screens/product_detail_screen.dart';
import 'package:snkr_app/common/widgets/product_showcase_widget.dart';
import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/utils/contants.dart';

class ProductGroupSection extends StatefulWidget {
  final String title;
  final List<Product> products;
  const ProductGroupSection({
    super.key,
    required this.title,
    required this.products,
  });

  @override
  State<ProductGroupSection> createState() => _ProductGroupSectionState();
}

class _ProductGroupSectionState extends State<ProductGroupSection> {
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: AppConstants.h1Bold.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  // letterSpacing: 1,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "SEE ALL",
                style: AppConstants.headingBlackBold.copyWith(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          // color: Colors.blue,
          child: ListView.builder(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: widget.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        List<Product> similarProducts = widget.products
                            .where(
                                (product) => product != widget.products[index])
                            .toList();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                      productId: 1,
                                      product: widget.products[index],
                                      similarProducts: similarProducts,
                                    )));
                      },
                      child: ProductShowcaseWidget(
                          product: widget.products[index],
                          hasBadge: widget.products[index].isNew ||
                              widget.products[index].hasDiscount,
                          maxlines: 2)),
                );
              }),
        )
      ],
    );
  }
}
