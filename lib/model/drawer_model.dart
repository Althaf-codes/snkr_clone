import 'package:flutter/material.dart';
import 'dart:convert';

class DrawerItem {
  final String name;
  final int id;
  final IconData icon;

  DrawerItem({
    required this.name,
    required this.id,
    required this.icon,
  });

  DrawerItem copyWith({
    String? name,
    int? id,
    IconData? icon,
  }) =>
      DrawerItem(
        name: name ?? this.name,
        id: id ?? this.id,
        icon: icon ?? this.icon,
      );

  factory DrawerItem.fromJson(String str) =>
      DrawerItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DrawerItem.fromMap(Map<String, dynamic> json) => DrawerItem(
        name: json["name"],
        id: json["id"],
        icon: json["icon"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "id": id,
        "icon": icon,
      };
}
