import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mock_card_product.dart';
import 'mock_detail_product.dart';
import 'mock_product_controller.dart';

class MockProductView extends GetView<MockProductController> {
  const MockProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key('ProductView'),
        backgroundColor: const Color(0xFFEBEBEB),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: TextFormField(
                  controller: TextEditingController(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 3,
                        )),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search here",
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFFA71B12),
                        ),
                      )
                    : GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 130 / 210,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(controller.listProduct.length,
                            (index) {
                          return GestureDetector(
                              key: Key('CardProductButton$index'),
                              child: MockProductCard(
                                controller: controller,
                                index: index,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MockDetailProductView()));
                              });
                        }),
                      ),
              )
            ],
          ),
        )));
  }
}
