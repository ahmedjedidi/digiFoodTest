import 'package:digifood_test/modules/cart/binding/cart_binding.dart';
import 'package:digifood_test/modules/cart/views/cart_view.dart';
import 'package:digifood_test/modules/detailproduct/bindings/detail_product_binding.dart';
import 'package:digifood_test/modules/detailproduct/views/detail_product_view.dart';
import 'package:digifood_test/modules/products/bindings/product_binding.dart';
import 'package:digifood_test/modules/products/views/product_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      binding: ProductBinding(),
    ),
    GetPage(
        name: _Paths.DETAILPRODUCT,
        page: () => DetailProductView(),
        binding: DetailProductBinding(),
        transition: Transition.rightToLeftWithFade,
        transitionDuration: const Duration(seconds: 2)),
    GetPage(
        name: _Paths.CART,
        page: () => CartView(),
        binding: CartBinding(),
        transition: Transition.upToDown,
        transitionDuration: const Duration(seconds: 2)),
  ];
}
