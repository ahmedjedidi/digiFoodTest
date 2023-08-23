import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  group("Flutter list product", () {
    //find all widget needed
    final cardPorduct = find.byValueKey("CardProduct0");
    final addToCart = find.text("Add to Cart");
    final cart = find.byValueKey("cart");
    final dimissible = find.byType("Dismissible");
    final snackBar = find.byType("snackBar");

    FlutterDriver? driver;

    setUpAll(() async {
      //init driver
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      //close driver
      if (driver != null) {
        driver?.close();
      }
    });

    test("add product to cart , and ListTile is shown", () async {
      // verify that 0 products are in the cart
      expect(find.text("0"), isNotNull);
      await driver?.tap(cardPorduct);
      await driver?.waitFor(addToCart);
      await driver?.tap(addToCart);
      await driver?.tap(find.pageBack());
      // verify that 1 products is in the cart
      expect(find.text("1"), isNotNull);
      await driver?.tap(cart);
      await driver?.scroll(
          dimissible, -400, 0, const Duration(milliseconds: 500));
      // verify that snackbar is not null
      expect(snackBar, isNotNull);
    });
  });
}
