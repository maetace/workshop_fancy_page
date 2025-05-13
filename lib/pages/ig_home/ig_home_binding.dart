import 'package:get/get.dart';
import 'package:workshop_0/pages/ig_home/ig_home_controller.dart';

class IgHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IgHomeController());
  }
}
