import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _tabController;
  TabController get tabController => _tabController;

  @override
  void onInit() {
    _tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }
}
