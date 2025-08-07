import 'package:flutter/material.dart';
import 'package:snkr_app/common/data/app_data.dart';
import 'package:snkr_app/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> saleProducts = AppData().saleProducts;
  List<Product> ascisProducts = AppData().asicProducts;
  List<Product> nikeShoes = AppData().nikeShoes;
  List<Product> categoryProducts = AppData().categoryProducts;
}
