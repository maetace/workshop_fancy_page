import 'package:get/get.dart';
import 'package:workshop_0/pages/x_home/x_home_controller.dart';

class XHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => XHomeController());
  }
}
