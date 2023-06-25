// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

//this file is the converted json to dart from the quicktype.io

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));


class Product {
  String id;
  String name;
  String imageUrl;
  List<dynamic> size;
  String price;
  String description;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.size,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    imageUrl: json["imageUrl"],
    size: List<dynamic>.from(json["size"].map((x) => x)),
    price: json["price"],
    description: json["description"],
  );


}
