import 'package:digifood_test/modules/detailproduct/bindings/detail_product_binding.dart';
import 'package:get/get.dart';

import 'mock_detail_product.dart';
import 'mock_product_binding.dart';
import 'mock_product_view.dart';

class MockAppPages {
  MockAppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.PRODUCT;

  static final routes = [
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const MockProductView(),
      binding: MockProductBinding(),
    ),
    GetPage(
      name: _Paths.DETAILPRODUCT,
      page: () => MockDetailProductView(),
      binding: DetailProductBinding(),
    ),
  ];
}

abstract class Routes {
  Routes._();
  // ignore: constant_identifier_names
  static const PRODUCT = _Paths.PRODUCT;
  // ignore: constant_identifier_names
  static const DETAIL_PRODUCT = _Paths.DETAILPRODUCT;
}

abstract class _Paths {
  _Paths._();
  // ignore: constant_identifier_names
  static const PRODUCT = '/mockproduct';
  // ignore: constant_identifier_names
  static const DETAILPRODUCT = '/detailproduct';
}
