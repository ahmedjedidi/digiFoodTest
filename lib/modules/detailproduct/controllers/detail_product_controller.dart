import 'package:get/get.dart';

class DetailProductController extends GetxController {
  var counter = 1.obs;

  increment() {
    counter++;
  }

  decrement() {
    if (counter > 1) {
      counter--;
    }
  }
}
