import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:workshop_0/languages.dart';
import 'package:workshop_0/pages/ig_home/ig_home_binding.dart';
import 'package:workshop_0/pages/ig_home/ig_home_page.dart';
import 'package:workshop_0/pages/home/home_binding.dart';
import 'package:workshop_0/pages/home/home_page.dart';
import 'package:workshop_0/pages/settings/settings_binding.dart';
import 'package:workshop_0/pages/settings/settings_controller.dart';
import 'package:workshop_0/pages/settings/settings_page.dart';
import 'package:workshop_0/pages/simple_profile/simple_profile_binding.dart';
import 'package:workshop_0/pages/simple_profile/simple_profile_page.dart';
import 'package:workshop_0/pages/x_home/x_home_binding.dart';
import 'package:workshop_0/pages/x_home/x_home_page.dart';
import 'package:workshop_0/themes.dart';

Future<void> main() async {
  await _init();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder:
          (context) => GetMaterialApp(
            title: 'Workshop App',
            // app page
            initialRoute: HomePage.route,
            getPages: [
              GetPage(
                name: HomePage.route,
                page: () => HomePage(),
                binding: HomeBinding(),
              ),
              GetPage(
                name: IgHomePage.route,
                page: () => IgHomePage(),
                binding: IgHomeBinding(),
              ),
              GetPage(
                name: XHomePage.route,
                page: () => XHomePage(),
                binding: XHomeBinding(),
              ),
              GetPage(
                name: SimpleProfilePage.route,
                page: () => SimpleProfilePage(),
                binding: SimpleProfileBinding(),
              ),
              GetPage(
                name: SettingsPage.route,
                page: () => SettingsPage(),
                binding: SettingsBinding(),
              ),
            ],
            // app theme
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: SettingsController.getThemeMode(),
            // app language
            translations: Languages(),
            locale: SettingsController.getLocale(),
            fallbackLocale: Locale('en', 'US'),
          ),
    ),
  );
}

Future<void> _init() async {
  // start storage drive
  await GetStorage.init();
  // register instance of GetStorage for later use
  Get.lazyPut(() => GetStorage());
}
