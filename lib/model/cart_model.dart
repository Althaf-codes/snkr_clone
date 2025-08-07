import 'dart:convert';

import 'package:snkr_app/model/product_model.dart';

class Cart {
  int quantity;
  final Product product;

  Cart({
    required this.quantity,
    required this.product,
  });

  Cart copyWith({
    int? quantity,
    Product? product,
  }) =>
      Cart(
        quantity: quantity ?? this.quantity,
        product: product ?? this.product,
      );

  factory Cart.fromJson(String str) => Cart.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
        quantity: json["Quantity"],
        product: Product.fromMap(json["product"]),
      );

  Map<String, dynamic> toMap() => {
        "Quantity": quantity,
        "product": product.toMap(),
      };
}
