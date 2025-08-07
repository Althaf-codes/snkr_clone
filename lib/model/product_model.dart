import 'dart:convert';

import 'package:snkr_app/model/size_guide_model.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final bool hasDiscount;
  final int discount;
  final String brandName;
  final String sku;
  final bool hasStock;
  final int totalStock;
  final bool isNew;
  final String category;
  final String subCategory;
  final bool isFeatured;
  final bool isBestSeller;
  final bool onSale;
  final List<String> image;
  final String color;
  final String discountTagline;
  final String releaseDate;
  final String isReleased;
  final String gender;
  final List<SizeGuide> sizes;
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.hasDiscount,
    required this.discount,
    required this.brandName,
    required this.sku,
    required this.hasStock,
    required this.totalStock,
    required this.isNew,
    required this.category,
    required this.subCategory,
    required this.isFeatured,
    required this.isBestSeller,
    required this.onSale,
    required this.image,
    required this.color,
    required this.discountTagline,
    required this.releaseDate,
    required this.isReleased,
    required this.gender,
    required this.sizes,
  });

  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    bool? hasDiscount,
    int? discount,
    String? brandName,
    String? sku,
    bool? hasStock,
    int? totalStock,
    bool? isNew,
    String? category,
    String? subCategory,
    bool? isFeatured,
    bool? isBestSeller,
    bool? onSale,
    List<String>? image,
    String? color,
    String? discountTagline,
    String? releaseDate,
    String? isReleased,
    String? gender,
    List<SizeGuide>? sizes,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        price: price ?? this.price,
        hasDiscount: hasDiscount ?? this.hasDiscount,
        discount: discount ?? this.discount,
        brandName: brandName ?? this.brandName,
        sku: sku ?? this.sku,
        hasStock: hasStock ?? this.hasStock,
        totalStock: totalStock ?? this.totalStock,
        isNew: isNew ?? this.isNew,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        isFeatured: isFeatured ?? this.isFeatured,
        isBestSeller: isBestSeller ?? this.isBestSeller,
        onSale: onSale ?? this.onSale,
        image: image ?? this.image,
        color: color ?? this.color,
        discountTagline: discountTagline ?? this.discountTagline,
        releaseDate: releaseDate ?? this.releaseDate,
        isReleased: isReleased ?? this.isReleased,
        gender: gender ?? this.gender,
        sizes: sizes ?? this.sizes,
      );

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      hasDiscount: json["hasDiscount"],
      discount: json["discount"],
      brandName: json["brandName"],
      sku: json["sku"],
      hasStock: json["hasStock"],
      totalStock: json["totalStock"],
      isNew: json["isNew"],
      category: json["category"],
      subCategory: json["subCategory"],
      isFeatured: json["isFeatured"],
      isBestSeller: json["isBestSeller"],
      onSale: json["onSale"],
      image: List<String>.from(json["image"].map((x) => x)),
      color: json["color"],
      discountTagline: json["discountTagline"],
      releaseDate: json["releaseDate"],
      isReleased: json["isReleased"],
      gender: json["Gender"],
      sizes:
          List<SizeGuide>.from(json["sizes"].map((e) => SizeGuide.fromMap(e)))
              .toList());

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "hasDiscount": hasDiscount,
        "discount": discount,
        "brandName": brandName,
        "sku": sku,
        "hasStock": hasStock,
        "totalStock": totalStock,
        "isNew": isNew,
        "category": category,
        "subCategory": subCategory,
        "isFeatured": isFeatured,
        "isBestSeller": isBestSeller,
        "onSale": onSale,
        "image": List<dynamic>.from(image.map((x) => x)),
        "color": color,
        "discountTagline": discountTagline,
        "releaseDate": releaseDate,
        "isReleased": isReleased,
        "Gender": gender,
        "Sizes": sizes
      };
}
