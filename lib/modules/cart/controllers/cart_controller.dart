import 'package:digifood_test/data/models/products_model.dart';
import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Product> cartProduct = Get.find<ProductController>().cartProduct;
  RxInt priceTotal = 0.obs;

  @override
  void onInit() {
    totalPrice();
    super.onInit();
  }

  totalPrice() {
    for (final product in cartProduct) {
      priceTotal.value += product.price * product.quantity.value;
    }
  }

  removeProduct(Product product){
    cartProduct.removeWhere((item) => item.id == product.id);
    priceTotal.value = priceTotal.value - product.price * product.quantity.value;
  }
}
