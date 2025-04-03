import 'package:flutter/material.dart';
import 'package:food_cart/theme/dark_model.dart';
import 'package:food_cart/theme/light_model.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkMode;

  setThemeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    // if(_themeData == lightMode){
    //   themeData = darkMode;
    // }
    // else{
    //   themeData = lightMode;
    // }

    setThemeData(_themeData == lightMode ? darkMode : lightMode);

  }
}