import 'dart:convert';

class FoodModel {
  List<Category> categories;

  FoodModel({
    required this.categories,
  });

  factory FoodModel.fromRawJson(String str) => FoodModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FoodModel.fromJson(List<dynamic> json) => FoodModel(
    categories: List<Category>.from(json.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  int id;
  String name;
  String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image_url": imageUrl,
  };
}
