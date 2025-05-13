import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';

class SettingsController extends GetxController {
  static const _themeModeKey = 'themeMode';
  static const _languageKey = 'language';

  late GetStorage _storage;

  final _currentThemeMode = Rx<ThemeMode?>(null);
  ThemeMode? get currentThemeMode => _currentThemeMode.value;

  late Map<String, String> _availableLanguages;
  Map<String, String> get availableLanguages => _availableLanguages;

  late String? _currentLanguage;
  String? get currentLanguage => _currentLanguage;

  @override
  void onInit() {
    // build available languages
    _availableLanguages = Get.translations.map<String, String>((key, value) {
      return MapEntry(key, value['label_display_language_name']!);
    });
    // find instance of GetStorage
    _storage = Get.find<GetStorage>();
    // load current theme mode
    _currentThemeMode.value = getThemeMode();
    // load current language
    final curLocale = getLocale();
    _currentLanguage = '${curLocale.languageCode}_${curLocale.countryCode}';

    super.onInit();
  }

  Future<void> onThemeModeChanged(ThemeMode? value) async {
    // set current theme mode
    _currentThemeMode.value = value;
    // change app theme mode
    Get.changeThemeMode(value!);
    // save current theme mode
    await _storage.write(_themeModeKey, value.name);
  }

  static ThemeMode getThemeMode() {
    final storage = Get.find<GetStorage>();
    final value = storage.read(_themeModeKey) ?? 'system';
    return ThemeMode.values.byName(value);
  }

  Future<void> onLanguageChnaged(String? value) async {
    // set current language
    _currentLanguage = value;
    // split "en_US" to "en" and "US"
    final langs = value!.split('_');
    // init date time format
    initializeDateFormatting(langs[0].toString());
    // change app locale
    Get.updateLocale(Locale(langs[0], langs[1]));
    // save current language
    await _storage.write(_languageKey, value);
  }

  static Locale getLocale() {
    final storage = Get.find<GetStorage>();
    final value = storage.read(_languageKey) ?? 'en_US';
    final langs = value.split('_');
    // init date time format
    initializeDateFormatting(langs[0].toString());
    return Locale(langs[0], langs[1]);
  }
}
