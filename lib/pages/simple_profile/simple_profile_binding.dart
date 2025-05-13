import 'package:get/get.dart';
import 'package:workshop_0/pages/simple_profile/simple_profile_controller.dart';

class SimpleProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SimpleProfileController());
  }
}
