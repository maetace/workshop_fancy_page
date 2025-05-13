import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IgHomePage extends GetView {
  static const route = '/ighome';

  const IgHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
          physics: BouncingScrollPhysics(),
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
            PointerDeviceKind.touch,
            PointerDeviceKind.trackpad,
          },
        ),
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text('IG'),
            centerTitle: false,
            actions: [Icon(Icons.favorite), Icon(Icons.bookmark)],
            actionsPadding: EdgeInsets.only(right: 8.0),
          ),
          SliverList.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              // create card
              final card = Card(
                child: SizedBox(
                  height: 350,
                  child: Center(child: Text('Card $index')),
                ),
              );

              if (index == 0) {
                // draw hirizontal list of reel and first card
                return Column(
                  children: [
                    SizedBox(
                      height: 96.0,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CircleAvatar(radius: 48.0);
                        },
                      ),
                    ),
                    card,
                  ],
                );
              }
              // draw second card and so on...
              return card;
            },
          ),
        ],
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
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.play_circle_outline_rounded),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
