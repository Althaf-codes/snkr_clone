import 'package:flutter/material.dart';
import 'package:snkr_app/common/widgets/snackbar.dart';
import 'package:snkr_app/model/cart_model.dart';
import 'package:snkr_app/model/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<Cart> _cartProducts = [];

  List<Cart> get cartProduct => _cartProducts;

  void addProduct(BuildContext context, {required Product product}) {
    final existingItem = _cartProducts.firstWhere(
      (item) => item.product.id == product.id,
      orElse: () => Cart(product: product, quantity: 0),
    );

    if (existingItem.quantity == 0) {
      _cartProducts.add(Cart(product: product, quantity: 1));
      notifyListeners();
      showSnackBar(context, 'Added to Cart');
    } else {
      increaseQuantity(product.id);
    }
  }

  void removeProduct(BuildContext context, {required String productId}) {
    _cartProducts.removeWhere((item) => item.product.id == productId);
    notifyListeners();
    showSnackBar(context, 'Removed from Cart');
  }

  void increaseQuantity(String productId) {
    final cartItem = _cartProducts.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => throw Exception("Product not found in cart"),
    );
    cartItem.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(BuildContext context, String productId) {
    final cartItem = _cartProducts.firstWhere(
      (item) => item.product.id == productId,
      orElse: () => throw Exception("Product not found in cart"),
    );
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      notifyListeners();
    } else {
      removeProduct(context, productId: productId);
    }
  }

  void clearCart() {
    _cartProducts.clear();
  }

  double getTotalPrice() {
    return _cartProducts.fold(
      0,
      (total, item) => total + (item.product.price * item.quantity),
    );
  }
// (cartItem.quantity * (cartItem.product.price - (cartItem.product.price * (cartItem.product.discount / 100)))).toStringAsFixed(3)

  double getTotalPriceAfterDiscount() {
    return _cartProducts.fold(
      0,
      (total, item) =>
          total +
          (item.quantity *
              (item.product.price -
                  (item.product.price * (item.product.discount / 100)))),
    );
  }

  bool containsProduct(Product product) {
    return _cartProducts.any((item) => item.product.id == product.id);
  }

  void displayCart() {
    for (var item in _cartProducts) {
      print(
          'Product: ${item.product.title}, Quantity: ${item.quantity}, Price: ${item.product.price}');
    }
    print('Total Price: ${getTotalPrice()}');
  }
}
