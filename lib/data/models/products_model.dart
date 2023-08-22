import 'package:get/get.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  final RxInt quantity = 1.obs;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
