import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class XHomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late GlobalKey<NestedScrollViewState> _scrollKey;
  GlobalKey<NestedScrollViewState> get scrollKey => _scrollKey;

  late TabController _tabController;
  TabController get tabController => _tabController;

  final _hideBottomNavBar = false.obs;
  bool get hideBottomNavBar => _hideBottomNavBar.value;

  ScrollController get innerController =>
      _scrollKey.currentState!.innerController;

  @override
  void onInit() {
    _scrollKey = GlobalKey<NestedScrollViewState>();
    _tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    _scrollKey.currentState?.outerController.addListener(_onScrolling);
    _scrollKey.currentState?.innerController.addListener(_onScrolling);
    super.onReady();
  }

  @override
  void onClose() {
    _tabController.dispose();
    super.onClose();
  }

  void _onScrolling() {
    // Fix exception: ScrollController attached to multiple scroll views.
    if (_scrollKey.currentState!.outerController.positions.length > 1 ||
        _scrollKey.currentState!.innerController.positions.length > 1) {
      return;
    }

    if (_scrollKey.currentState!.outerController.position.userScrollDirection ==
            ScrollDirection.reverse ||
        _scrollKey.currentState!.innerController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      _hideBottomNavBar.value = true;
    }

    if (_scrollKey.currentState!.outerController.position.userScrollDirection ==
            ScrollDirection.forward ||
        _scrollKey.currentState!.innerController.position.userScrollDirection ==
            ScrollDirection.forward) {
      _hideBottomNavBar.value = false;
    }
  }
}
