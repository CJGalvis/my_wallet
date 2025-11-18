import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LanguageProvider extends ChangeNotifier {
  final List<String> assetsFileNames;
  String? currentLanguage;

  LanguageProvider({
    required this.assetsFileNames,
    this.currentLanguage = 'es',
  }) {
    _setLabels();
  }

  bool _isLoading = true;

  Map<String, Map<String, dynamic>> appLabels = {};

  bool get isLoading => _isLoading;

  void changeLanguage(String language) {
    if (currentLanguage != language) {
      currentLanguage = language;
      _isLoading = true;
      _setLabels();
    }
  }

  Map<String, dynamic> getWidgetsLabels(String prop) {
    return appLabels[prop]!;
  }

  Future<void> _setLabels() async {
    for (String json in assetsFileNames) {
      final Map<String, dynamic> jsonMap = await _getJson(json);
      appLabels[json] = jsonMap;
    }
    notifyListeners();
    _isLoading = false;
  }

  Future<Map<String, dynamic>> _getJson(String jsonPath) async {
    final jsonString = await rootBundle
        .loadString('assets/locale/$currentLanguage/$jsonPath.json')
        .onError(
      (error, stack) {
        throw Exception('Error al cargar el json');
      },
    );

    return json.decode(jsonString);
  }
}
