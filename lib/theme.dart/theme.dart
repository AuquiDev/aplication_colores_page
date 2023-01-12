// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData? _currenttheme;

  bool get darltheme => _darkTheme;
  bool get customTheme => _customTheme;
  ThemeData? get currenttheme => _currenttheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currenttheme = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currenttheme = ThemeData.dark().copyWith(
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: Colors.brown));
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currenttheme = ThemeData.light();
    }
  }

  set darltheme(bool value) {
    _customTheme = false;
    _darkTheme = value;
    if (value) {
      _currenttheme = ThemeData.dark().copyWith(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.brown));
    } else {
      _currenttheme = ThemeData.light();
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currenttheme = ThemeData.dark().copyWith(
          
          accentColor: Colors.brown,
          primaryColorLight: Colors.white,
          scaffoldBackgroundColor: Colors.grey,
          appBarTheme: const AppBarTheme(color: Colors.brown),
          textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.brown));
          
    } else {
      _currenttheme = ThemeData.light();
    }
    notifyListeners();
  }
}
