import 'package:digifood_test/data/models/products_model.dart';
import 'package:get/get.dart';

import 'mock_app_page.dart';

class MockProductController extends GetxController {
  var isLoading = true.obs;
  RxList listProduct = List.empty(growable: true).obs;
  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  Future<void> getAllProduct() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 3));
      listProduct.value = [
        Product(
            id: "id",
            title: "title1",
            description: "description",
            price: 300,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/androidecommercesample.appspot.com/o/playstation_1.png?alt=media&token=1414f40e-23cf-4f44-b922-e12bfcfca9f3"),
        Product(
            id: "id",
            title: "title2",
            description: "description",
            price: 300,
            imageUrl:
                "https://firebasestorage.googleapis.com/v0/b/androidecommercesample.appspot.com/o/playstation_1.png?alt=media&token=1414f40e-23cf-4f44-b922-e12bfcfca9f3")
      ];
    } finally {
      isLoading(false);
    }
  }

  navigateToDetail(index) {
    Get.toNamed(Routes.DETAIL_PRODUCT, arguments: index);
  }

    runFilter(String enteredKeyword) async {
  
    
      listProduct.value = listProduct
          .where((product) => product.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    
  }
}
