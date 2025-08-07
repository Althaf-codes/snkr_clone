import 'package:flutter/material.dart';
import 'package:snkr_app/common/widgets/snackbar.dart';
import 'package:snkr_app/model/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  List<Product> favoriteProducts = [];

  void addProduct(BuildContext context, {required Product product}) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      // print("the favourite product Added is ${favoriteProducts}");
      notifyListeners();
      showSnackBar(context, 'Added to Favorites');
    }
  }

  void removeProduct(BuildContext context, {required Product product}) {
    favoriteProducts.remove(product);
    // print("the favourite product Removed is ${favoriteProducts}");
    notifyListeners();
    showSnackBar(context, 'Removed from Favorites');
  }

  bool hasMatch({required Product product}) {
    return favoriteProducts.contains(product);
  }
}
