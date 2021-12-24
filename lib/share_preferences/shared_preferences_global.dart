import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static late SharedPreferences _prefs;

  //propiedades globales

  static String _name = '';
  static bool   _isDarkmode = false;
  static int    _gender = 1;

  static Future init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static String get getName{
    //obtener el valor de las preferencias, se obtiene a través del "key", que es el nombre
    //que le dimos a la propiedad de la preferencia

    return _prefs.getString('name') ?? _name;
  }

  static set setName(String name){
    //asignar valor a la propiedad
    _name = name;
    //Grabar en las preferencias del usuario
    _prefs.setString('name', name);
  }

  static bool get getIsDarkMode{
    //obtener el valor de las preferencias, se obtiene a través del "key", que es el nombre
    //que le dimos a la propiedad de la preferencia

    return _prefs.getBool('dark') ?? _isDarkmode;
  }

  static set setIsDarkMode(bool isDarkmode){
    //asignar valor a la propiedad
    _isDarkmode = isDarkmode;
    //Grabar en las preferencias del usuario
    _prefs.setBool('dark', isDarkmode);
  }

  static int get getGender{
    //obtener el valor de las preferencias, se obtiene a través del "key", que es el nombre
    //que le dimos a la propiedad de la preferencia

    return _prefs.getInt('gender') ?? _gender;
  }

  static set setGender(int gender){
    //asignar valor a la propiedad
    _gender = gender;
    //Grabar en las preferencias del usuario
    _prefs.setInt('gender', gender);
  }


}