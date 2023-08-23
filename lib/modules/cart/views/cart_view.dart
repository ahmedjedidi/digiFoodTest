import 'package:digifood_test/modules/cart/controllers/cart_controller.dart';
import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartView extends GetView<CartController> {
  CartView({super.key});
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEBEBEB),
        appBar: AppBar(
          title: Obx(
              () => Text('Total Price : ${controller.priceTotal.value} \$')),
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontWeight: FontWeight.w400, color: Colors.black, fontSize: 17),
        ),
        body: SafeArea(
            child: Obx(
          () => ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: controller.cartProduct.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Dismissible(
                        key: Key(controller.cartProduct[index].id),
                        onDismissed: (direction) {
                          final product = controller.cartProduct[index].title;
                          controller
                              .removeProduct(controller.cartProduct[index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('$product deleted')));
                        },
                        background: Container(color: Colors.red),
                        child: ListTile(
                          leading: Image.network(
                            controller.cartProduct[index].imageUrl,
                            fit: BoxFit.contain,
                          ),
                          title: Text(controller.cartProduct[index].title),
                          trailing: Text(
                              'x ${controller.cartProduct[index].quantity.value.toString()}'),
                          subtitle: Text(
                              '${controller.cartProduct[index].price.toString()} \$'),
                        )));
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  color: const Color(0xFFA7A8AB),
                  height: 1,
                  width: double.infinity,
                );
              }),
        )));
  }
}
