import 'package:get/get.dart';

class TestController extends GetxController {
  RxInt count1 = 0.obs;
  int count2 = 0;

  var count = 0.obs;
  Map list = {
    'first': '111',
    'last': '222',
  }.obs;
  increment1() {}

  // increment2() {
  //   count1 = count1 + 1;
  //   update(['update2']);
  // }
}
