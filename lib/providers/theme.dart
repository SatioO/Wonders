import 'package:flutter/material.dart';
import '../utils/colors.dart';

enum Themes { light, dark, system }

const Themes _defaultTheme = Themes.system;

final Map<Themes, ThemeData> _themeData = {
  Themes.light: ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    accentColor: lightAccentColor,
  ),
  Themes.dark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    accentColor: darkAccentColor,
  )
};

class ThemeProvider with ChangeNotifier {
  static Themes _theme = _defaultTheme;
  static ThemeData _appThemeData = _themeData[_theme];

  Themes get theme => _theme;

  set theme(Themes theme) {
    if (theme != null) {
      _theme = theme;
      _appThemeData = _themeData[theme];
      notifyListeners();
    }
  }

  ThemeData requestTheme(Themes fallback) =>
      theme == Themes.system ? _themeData[fallback] : _appThemeData;
}
