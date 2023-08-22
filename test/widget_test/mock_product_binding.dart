import 'package:get/instance_manager.dart';

import 'mock_product_controller.dart';

class MockProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MockProductController>(MockProductController());
  }
}
