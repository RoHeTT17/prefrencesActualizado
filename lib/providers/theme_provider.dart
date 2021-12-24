import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

   //Es ThemeData porque es el valor que recibe la propiedad theme en el widget de MaterialApp
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkmode})
      //inicializar la variable en el cosntructor
      : currentTheme = isDarkmode ? ThemeData.dark() : ThemeData.light();


  setLightMode(){
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setDarkMode(){
    currentTheme = ThemeData.dark();
    notifyListeners();
  }

}