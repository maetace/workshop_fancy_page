import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_0/pages/simple_profile/simple_profile_controller.dart';

class SimpleProfilePage extends GetView<SimpleProfileController> {
  static const route = '/simpleprofile';

  const SimpleProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabNames = ['Posts', 'Photos', 'Videos'];

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
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                pinned: true,
                forceElevated: innerBoxIsScrolled,
                centerTitle: true,
                title: innerBoxIsScrolled ? Text('Profile') : SizedBox(),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.create)),
                ],
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    children: [
                      SizedBox(
                        height: 260,
                        child: Stack(
                          children: [
                            Container(color: Colors.amber, height: 200),
                            Positioned(
                              left: 10,
                              top: 140,
                              child: CircleAvatar(radius: 60),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: [Text('Profile')]),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  controller: controller.tabController,
                  tabs: tabNames.map((tabName) => Text(tabName)).toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: BouncingScrollPhysics(),
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
      bottomNavigationBar: SafeArea(
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
      ),
    );
  }
}
