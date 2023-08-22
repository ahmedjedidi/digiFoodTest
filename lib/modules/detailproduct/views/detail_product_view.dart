import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_product_controller.dart';

// ignore: must_be_immutable
class DetailProductView extends GetView<DetailProductController> {
  DetailProductView({Key? key}) : super(key: key);
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
        body: SingleChildScrollView(
            child: Column(children: [
          Image.network(
            productController.listProduct[Get.arguments].imageUrl,
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    topLeft: Radius.circular(40.0),
                  )),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(
                                productController
                                    .listProduct[Get.arguments].title,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600))),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            decoration: const BoxDecoration(
                                color: Color(0xFFCD3E20),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Text(
                              '\$${productController.listProduct[Get.arguments].price}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ))
                      ]),
                  const SizedBox(height: 20),
                  Text(productController.listProduct[Get.arguments].description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Color(0xFFA7A8AB))),
                  const SizedBox(height: 20),
                  Container(
                    color: const Color(0xFFA7A8AB),
                    height: 0.5,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  Obx(() => Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color(0xFFF6F6F6)),
                            child: Row(
                              children: [
                                GestureDetector(
                                    key: const Key('decrement'),
                                    onTap: () => controller.decrement(),
                                    child: const CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 20,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                          size: 16,
                                        ))),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 3),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3, vertical: 2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: Colors.white),
                                  child: Text(
                                    controller.counter.toString(),
                                    key: const Key('counter'),
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                                GestureDetector(
                                    key: const ValueKey('increment'),
                                    onTap: () => controller.increment(),
                                    child: const CircleAvatar(
                                        backgroundColor: Colors.black,
                                        radius: 20,
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 16,
                                        ))),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                      height: 60,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF373737),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // <-- Radius
                                          ),
                                        ),
                                        onPressed: () {
                                          productController.addProductToCart(
                                              controller.counter.value,
                                              productController
                                                  .listProduct[Get.arguments]);
                                        },
                                        child: const Text(
                                          "Add to Cart",
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: Color(0xFFEBEBEB),
                                          ),
                                        ),
                                      ))))
                        ],
                      ))
                ]),
              ))
        ])));
  }
}
