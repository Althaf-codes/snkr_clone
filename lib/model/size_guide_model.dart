import 'dart:convert';

class SizeGuide {
  final String country;
  final List<Size> sizes;

  SizeGuide({
    required this.country,
    required this.sizes,
  });

  SizeGuide copyWith({
    String? country,
    List<Size>? sizes,
  }) =>
      SizeGuide(
        country: country ?? this.country,
        sizes: sizes ?? this.sizes,
      );

  factory SizeGuide.fromJson(String str) => SizeGuide.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SizeGuide.fromMap(Map<String, dynamic> json) => SizeGuide(
        country: json["country"],
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "country": country,
        "sizes": List<dynamic>.from(sizes.map((x) => x.toMap())),
      };
}

class Size {
  final String size;
  final String id;
  final int totalStock;

  Size({
    required this.size,
    required this.id,
    required this.totalStock,
  });

  Size copyWith({
    String? size,
    String? id,
    int? totalStock,
  }) =>
      Size(
        size: size ?? this.size,
        id: id ?? this.id,
        totalStock: totalStock ?? this.totalStock,
      );

  factory Size.fromJson(String str) => Size.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Size.fromMap(Map<String, dynamic> json) => Size(
        size: json["size"],
        id: json["id"],
        totalStock: json["totalStock"],
      );

  Map<String, dynamic> toMap() => {
        "size": size,
        "id": id,
        "totalStock": totalStock,
      };
}
