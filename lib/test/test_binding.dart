import 'test_controller.dart';
import 'package:get/get.dart';


/// @class : SplashBinding
/// @date : 2021/08/16
/// @name : jhf
/// @description :启动页 binding层
class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => TestController());
  }
}
