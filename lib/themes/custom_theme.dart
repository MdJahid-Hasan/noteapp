import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = true;

  static ThemeMode currentTheme() {
    if (_isDarkTheme == true) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
      textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20, color: Colors.black),
          bodyText2: TextStyle(fontSize: 15, color: Colors.grey)),
      primarySwatch: Colors.orange,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        ),
      ),
      textTheme: TextTheme(
          bodyText1: TextStyle(fontSize: 20, color: Colors.white),
          bodyText2: TextStyle(fontSize: 15, color: Colors.white)),
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
