import 'package:digifood_test/modules/products/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}
