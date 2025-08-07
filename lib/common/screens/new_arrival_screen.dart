import 'package:flutter/material.dart';

import 'package:snkr_app/common/screens/categorywise_product_screen.dart';

class NewArrivalScreen extends StatelessWidget {
  final String title;
  const NewArrivalScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CategorywiseProductsScreen(title: title);
  }
}
