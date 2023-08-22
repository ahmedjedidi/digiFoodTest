import 'dart:convert';

import 'package:digifood_test/data/models/products_model.dart';
import 'package:digifood_test/data/urls.dart';
import 'package:http/http.dart' as http;

abstract class ProductsService {
  Future<List<Product>> getAllProduct();
}

class ProductServiceImplt extends ProductsService {
  var client = http.Client();

  @override
  Future<List<Product>> getAllProduct() async {
    var response = await client.get(Uri.parse(Urls.produts));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body);
      List<Product> product =
          List<Product>.from(l.map((model) => Product.fromJson(model)));
      return product;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Prodcuts');
    }
  }
}
