import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme;

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: // Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light();
        break;

      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;

      case 3: // Custom
        _darkTheme = false;
        _customTheme = true;
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      Color _customAccentColor = Color(0xff0E6D51);
      Color _customPrimaryColor = Color(0xffD9E4DA);
      Color _customDividerColor = Color(0xff004954);

      _currentTheme = ThemeData.dark().copyWith(
        primaryColor: _customPrimaryColor,
        accentColor: _customAccentColor,
        dividerColor: _customDividerColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: _customPrimaryColor),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: _customPrimaryColor),
      );
    } else {
      Color _customAccentColor = Color(0xff004954);
      Color _customPrimaryColor = Color(0xff0E6D51);
      Color _customDividerColor = Color(0xffC1C1C1);

      _currentTheme = ThemeData.light().copyWith(
        primaryColor: _customPrimaryColor,
        accentColor: _customAccentColor,
        dividerColor: _customDividerColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: _customPrimaryColor),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: _customPrimaryColor),
      );
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;

    Color _customAccentColor = Color(0xff261A3D);
    Color _customPrimaryColor = Color(0xff5C408D);
    Color _customDividerColor = Color(0xffC1C1C1);

    if (value) {
      _currentTheme = ThemeData.light().copyWith(
        primaryColor: _customPrimaryColor,
        accentColor: _customAccentColor,
        dividerColor: _customDividerColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: _customPrimaryColor),
        ),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: _customPrimaryColor),
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
