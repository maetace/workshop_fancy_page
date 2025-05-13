import 'package:get/get.dart';
import 'package:workshop_0/pages/ig_home/ig_home_page.dart';
import 'package:workshop_0/pages/settings/settings_page.dart';
import 'package:workshop_0/pages/simple_profile/simple_profile_page.dart';
import 'package:workshop_0/pages/x_home/x_home_page.dart';

class HomeController extends GetxController {
  final _counter = 0.obs;
  int get counter => _counter.value;

  final _lastUpdate = Rx<DateTime>(DateTime.now());
  DateTime get lastUpdate => _lastUpdate.value;

  void onAddButtonPressed() {
    _counter.value += 1;
    _lastUpdate.value = DateTime.now();
  }

  void onButton1Pressed() {
    Get.toNamed(IgHomePage.route);
  }

  void onButton2Pressed() {
    Get.toNamed(XHomePage.route);
  }

  void onButton3Pressed() {
    Get.toNamed(SimpleProfilePage.route);
  }

  void onButton4Pressed() {
    Get.toNamed(SettingsPage.route);
  }
}
