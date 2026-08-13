import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('id');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!['id', 'en'].contains(locale.languageCode)) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleLocale() {
    if (_locale.languageCode == 'id') {
      _locale = const Locale('en');
    } else {
      _locale = const Locale('id');
    }
    notifyListeners();
  }
}
