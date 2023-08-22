import 'package:digifood_test/data/models/products_model.dart';
import 'package:digifood_test/data/services/products_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_service_test.mocks.dart';

class ProductServiceTest extends Mock implements ProductsService {}

@GenerateMocks([ProductServiceTest])
void main() {
  group('Product', () {
    late MockProductServiceTest productService;
    setUpAll(() {
      productService = MockProductServiceTest();
    });

    test('returns a List of products if the Future completes successfully',
        () async {
      final model = <Product>[];
      when(productService.getAllProduct()).thenAnswer((_) async {
        return model;
      });
      final res = await productService.getAllProduct();
      expect(res, isA<List<Product>>());
      expect(res, model);
    });

    test('test getAllProduct throws Exception', () {
      when(productService.getAllProduct()).thenAnswer((_) async {
        throw Exception();
      });
      final res = productService.getAllProduct();
      expect(res, throwsException);
    });
  });
}