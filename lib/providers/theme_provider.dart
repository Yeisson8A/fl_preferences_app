import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData currentTheme;

  ThemeProvider({
    required bool isDarkmode
  }): currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();

  setLightMode() {
    currentTheme = ThemeData.light();
    // Redibujar widgets
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = ThemeData.dark();
    // Redibujar widgets
    notifyListeners();
  }
}