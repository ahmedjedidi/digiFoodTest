import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);
  final ProductController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 250,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Card(
                  margin: const EdgeInsets.all(20),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.network(
                    controller.listProduct[index].imageUrl,
                    fit: BoxFit.contain,
                  )),
              Positioned(
                  top: 30,
                  right: 30,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: const BoxDecoration(
                          color: Color(0xFFCD3E20),
                          borderRadius:
                              BorderRadius.all(Radius.circular(40.0))),
                      child: Text(
                        '\$${controller.listProduct[index].price}',
                        style: const TextStyle(color: Colors.white),
                      ))),
            ],
          )),
      Flexible(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Flexible(
                  child: Text(
                    controller.listProduct[index].title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ])))
    ]);
  }
}
