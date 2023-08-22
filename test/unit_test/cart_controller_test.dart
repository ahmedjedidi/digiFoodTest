import 'package:digifood_test/data/models/products_model.dart';
import 'package:digifood_test/modules/cart/controllers/cart_controller.dart';
import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('Product', () {
    late List<Product> listCartProducts;
    late CartController cartController;
    late ProductController productController;
    setUpAll(() {
      listCartProducts = [
        Product(
            id: "1",
            title: "title1",
            description: "description1",
            price: 300,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/androidecommercesample.appspot.com/o/playstation_1.png?alt=media&token=1414f40e-23cf-4f44-b922-e12bfcfca9f3"),
        Product(
            id: "2",
            title: "title2",
            description: "description",
            price: 300,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/androidecommercesample.appspot.com/o/playstation_1.png?alt=media&token=1414f40e-23cf-4f44-b922-e12bfcfca9f3")
      ];
      productController = Get.put(ProductController());
      cartController = Get.put(CartController());
    });

    test('test total price function', () async {
      productController.addProductToCart(2, listCartProducts[0]);
      productController.addProductToCart(1, listCartProducts[1]);
      cartController.totalPrice();
      expect(cartController.priceTotal.value, 2 * 300 + 300);
      cartController.removeProduct(listCartProducts[0]);
      expect(cartController.priceTotal.value, 300);
    });

    test('test add/delete product to cart function', () async {
      productController.addProductToCart(2, listCartProducts[0]);
      productController.addProductToCart(1, listCartProducts[1]);
      expect(productController.cartProduct, listCartProducts);
      cartController.removeProduct(listCartProducts[0]);
      expect(cartController.cartProduct, [listCartProducts[1]]);
    });
  });
}
