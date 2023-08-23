import 'package:digifood_test/modules/products/views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/product_controller.dart';
import 'package:badges/badges.dart' as badges;

class ProductView extends GetView<ProductController> {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key('ProductView'),
        backgroundColor: const Color(0xFFEBEBEB),
        appBar: AppBar(
          title: const Text("Product List"),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.w400, color: Colors.black, fontSize: 17),
          actions: [
            Obx(() => badges.Badge(
                position: badges.BadgePosition.topEnd(top: 2, end: 2),
                showBadge: true,
                badgeContent: Text(controller.cartProduct.length.toString()),
                child: IconButton(
                    key: const Key("cart"),
                    padding: const EdgeInsets.all(8),
                    onPressed: () {
                      Get.toNamed(Routes.CART);
                    },
                    icon: const Icon(Icons.shopping_cart))))
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: TextFormField(
                  onChanged: (value) {
                    controller.runFilter(value);
                  },
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
                        key: const Key('CardProductlist'),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 130 / 210,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(controller.listProduct.length,
                            (index) {
                          return GestureDetector(
                            key:  Key('CardProduct$index'),
                              child: ProductCard(
                                controller: controller,
                                index: index,
                              ),
                              onTap: () {
                                controller.navigateToDetail(index);
                              });
                        }),
                      ),
              )
            ],
          ),
        )));
  }
}
