import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_0/pages/x_home/x_home_controller.dart';

class XHomePage extends GetView<XHomeController> {
  static const route = '/xhome';

  const XHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabNames = ['For you', 'Following'];

    return Scaffold(
      body: NestedScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          physics: BouncingScrollPhysics(),
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        key: controller.scrollKey,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                forceElevated: innerBoxIsScrolled,
                title: Text('X'),
                bottom: TabBar(
                  controller: controller.tabController,
                  tabs: tabNames.map((tabName) => Text(tabName)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: controller.tabController,
          children:
              tabNames.map((tabName) {
                return Builder(
                  builder: (context) {
                    return CustomScrollView(
                      // remember scrolling position for this tab
                      key: PageStorageKey(tabName),
                      // fix exception: The provided ScrollController is attached to more than one ScrollPosition.
                      scrollBehavior: ScrollConfiguration.of(
                        context,
                      ).copyWith(scrollbars: false),
                      slivers: [
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                context,
                              ),
                        ),
                        SliverList.builder(
                          itemCount: 100,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: 300,
                              child: Card(
                                child: Center(
                                  child: Text('$tabName - item $index'),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
        ),
      ),
      bottomNavigationBar: Obx(
        () => AnimatedContainer(
          duration: Durations.medium1,
          height: controller.hideBottomNavBar ? 0 : 74,
          child:
              controller.hideBottomNavBar
                  ? _buildBottomNavBar()
                  : _buildBottomNavBar(),
        ),
      ),
    );
  }

  SafeArea _buildBottomNavBar() {
    return SafeArea(
      left: false,
      right: false,
      top: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
