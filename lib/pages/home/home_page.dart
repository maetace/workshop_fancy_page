import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_0/pages/home/home_controller.dart';
import 'package:workshop_0/utils.dart';

class HomePage extends GetView<HomeController> {
  static const route = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page_title_home'.tr)),
      body: Center(
        child: Column(
          spacing: 10.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.onButton1Pressed,
              child: Text('button_fancy_page_1'.tr),
            ),
            ElevatedButton(
              onPressed: controller.onButton2Pressed,
              child: Text('button_fancy_page_2'.tr),
            ),
            ElevatedButton(
              onPressed: controller.onButton3Pressed,
              child: Text('button_fancy_page_3'.tr),
            ),
            ElevatedButton(
              onPressed: controller.onButton4Pressed,
              child: Text('button_settings_page'.tr),
            ),
            Obx(
              () => Text(
                'label_tap_time'.trPluralParams(
                  'label_tap_times',
                  controller.counter <= 0 ? 1 : controller.counter,
                  {'counter': getDisplayNumber(controller.counter)},
                ),
              ),
            ),
            Obx(
              () => Text(
                'label_last_update'.trParams({
                  'time': getDisplayDate(controller.lastUpdate),
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onAddButtonPressed,
        child: Icon(Icons.add),
      ),
    );
  }
}
