import 'package:flutter/material.dart';
import 'package:snkr_app/common/screens/product_detail_screen.dart';
import 'package:snkr_app/common/widgets/product_showcase_widget.dart';
import 'package:snkr_app/model/product_model.dart';
import 'package:snkr_app/utils/contants.dart';

class RelatedProductSection extends StatelessWidget {
  final String title;
  final List<Product> similarProducts;

  const RelatedProductSection({
    super.key,
    required this.title,
    required this.similarProducts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12),
          child: Text(
            title,
            style: AppConstants.h1Bold.copyWith(letterSpacing: 1, fontSize: 16),
          ),
        ),
        SizedBox(
          height: 300,
          // color: Colors.blue,
          child: ListView.builder(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: similarProducts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    List<Product> relatedProducts = similarProducts
                        .where((product) => product != similarProducts[index])
                        .toList();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                                productId: 1,
                                product: similarProducts[index],
                                similarProducts: relatedProducts)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductShowcaseWidget(
                      product: similarProducts[index],
                    ),
                  ),
                  // ),
                );
              }),
        )
      ],
    );
  }
}
