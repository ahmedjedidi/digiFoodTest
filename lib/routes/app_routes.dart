part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  // ignore: constant_identifier_names
  static const PRODUCT = _Paths.PRODUCT;
  // ignore: constant_identifier_names
  static const DETAIL_PRODUCT = _Paths.DETAILPRODUCT;
  // ignore: constant_identifier_names
  static const CART = _Paths.CART;
}

abstract class _Paths {
  _Paths._();
  // ignore: constant_identifier_names
  static const PRODUCT = '/product';
  // ignore: constant_identifier_names
  static const DETAILPRODUCT = '/detailproduct';
  // ignore: constant_identifier_names
  static const CART = '/cart';
}
