import 'dart:ui';

import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localisedValues = {
    'en': {
      'makerTitle': "Maker",
    },
    'ru': {
      'makerTitle': "Конструктор",
    },
  };

  get currentLanguage => locale.languageCode;

  String get makerTitle {
    return _localisedValues[locale.languageCode]['makerTitle'];
  }
}
