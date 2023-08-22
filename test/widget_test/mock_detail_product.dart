import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MockDetailProductView extends StatelessWidget {
  MockDetailProductView({Key? key}) : super(key: key);
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('DetailProductView'),
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text("Detail Product"),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w400, color: Colors.black, fontSize: 17),
        actions: const [],
      ),
    );
  }
}
