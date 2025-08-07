// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:snkr_app/common/screens/product_detail_screen.dart';

import 'package:snkr_app/common/widgets/product_showcase_widget.dart';
import 'package:snkr_app/model/product_model.dart';

class ProductGridSection extends StatelessWidget {
  final List<Product> products;

  const ProductGridSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: products.length, // widget.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 5, //5.4 (mobile)
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                List<Product> similarProducts = products
                    .where((product) => product != products[index])
                    .toList();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                              productId: 1,
                              product: products[index],
                              similarProducts: similarProducts,
                            )));
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ProductShowcaseWidget(
                    key: ValueKey(products[index].id),
                    hasBadge:
                        products[index].isNew || products[index].hasDiscount,
                    product: products[index]),
              ),
            );
            // );
          }),
    );
  }
}
