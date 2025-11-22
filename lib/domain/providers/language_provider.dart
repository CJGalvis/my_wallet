import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/config/assets_config_language.dart';

final languageProvider = AsyncNotifierProvider<LanguageNotifier,
    Map<String, Map<String, dynamic>>>(
  () => LanguageNotifier(
    assetsFileNames: AssetsConfigLanguage.assetsFileNames,
  ),
);

class LanguageNotifier
    extends AsyncNotifier<Map<String, Map<String, dynamic>>> {
  final List<String> assetsFileNames;
  String currentLanguage = 'es';

  LanguageNotifier({required this.assetsFileNames});

  @override
  Future<Map<String, Map<String, dynamic>>> build() async {
    return _setLabels();
  }

  Future<void> changeLanguage(String language) async {
    if (currentLanguage != language) {
      currentLanguage = language;
      state = const AsyncValue.loading();
      state = AsyncValue.data(await _setLabels());
    }
  }

  Map<String, dynamic> getWidgetsLabels(String prop) {
    return state.value![prop]!;
  }

  Future<Map<String, Map<String, dynamic>>> _setLabels() async {
    final Map<String, Map<String, dynamic>> appLabels = {};

    for (String fileName in assetsFileNames) {
      final jsonString = await rootBundle.loadString(
        'assets/locale/$currentLanguage/$fileName.json',
      );
      appLabels[fileName] = json.decode(jsonString);
    }

    return appLabels;
  }
}
