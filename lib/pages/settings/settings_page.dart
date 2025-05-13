import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workshop_0/pages/settings/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  static const route = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('page_title_settings'.tr)),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () => ListTile(
                title: Text('label_theme_mode'.tr),
                subtitle: Column(
                  children: [
                    RadioListTile(
                      title: Text('label_theme_mode_dark'.tr),
                      value: ThemeMode.dark,
                      groupValue: controller.currentThemeMode,
                      onChanged: controller.onThemeModeChanged,
                    ),
                    RadioListTile(
                      title: Text('label_theme_mode_light'.tr),
                      value: ThemeMode.light,
                      groupValue: controller.currentThemeMode,
                      onChanged: controller.onThemeModeChanged,
                    ),
                    RadioListTile(
                      title: Text('label_theme_mode_system'.tr),
                      value: ThemeMode.system,
                      groupValue: controller.currentThemeMode,
                      onChanged: controller.onThemeModeChanged,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('label_display_language'.tr),
              subtitle: DropdownButtonFormField<String>(
                value: controller.currentLanguage,
                items:
                    controller.availableLanguages.entries.map((entry) {
                      return DropdownMenuItem<String>(
                        value: entry.key,
                        child: Text(entry.value),
                      );
                    }).toList(),
                onChanged: controller.onLanguageChnaged,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
