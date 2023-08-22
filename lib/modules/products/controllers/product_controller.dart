import 'package:digifood_test/data/services/products_service.dart';
import 'package:digifood_test/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/models/products_model.dart';

class ProductController extends GetxController {
  final ProductServiceImplt productService = ProductServiceImplt();
  var isLoading = true.obs;
  RxList listProduct = List.empty(growable: true).obs;
  RxList<Product> cartProduct = List<Product>.empty(growable: true).obs;

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }

  Future<void> getAllProduct() async {
    try {
      isLoading(true);
      listProduct.value = await productService.getAllProduct();
    } finally {
      isLoading(false);
    }
  }

  navigateToDetail(index) {
    Get.toNamed(Routes.DETAIL_PRODUCT, arguments: index);
  }

  addProductToCart(int quantity, Product product) {
    // ignore: invalid_use_of_protected_member
    if (cartProduct.value.contains(product)) {
      product.quantity.value += quantity;
    } else {
      product.quantity.value = quantity;
      cartProduct.add(product);
    }
  }

  runFilter(String enteredKeyword) async {
    final listInitialProduct = await productService.getAllProduct();
    if (enteredKeyword.isEmpty) {
      listProduct.value = listInitialProduct;
    } else {
      listProduct.value = listInitialProduct
          .where((product) => product.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
  }
}
