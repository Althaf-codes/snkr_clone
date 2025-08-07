import 'dart:convert';

class SubMenuModel {
  final String title;
  final int id;
  final List<Item> items;

  SubMenuModel({
    required this.title,
    required this.id,
    required this.items,
  });

  SubMenuModel copyWith({
    String? title,
    int? id,
    List<Item>? items,
  }) =>
      SubMenuModel(
        title: title ?? this.title,
        id: id ?? this.id,
        items: items ?? this.items,
      );

  factory SubMenuModel.fromJson(String str) =>
      SubMenuModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubMenuModel.fromMap(Map<String, dynamic> json) => SubMenuModel(
        title: json["title"],
        id: json["id"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "id": id,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  final String title;
  final int id;

  Item({
    required this.title,
    required this.id,
  });

  Item copyWith({
    String? title,
    int? id,
  }) =>
      Item(
        title: title ?? this.title,
        id: id ?? this.id,
      );

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        title: json["title"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "id": id,
      };
}
