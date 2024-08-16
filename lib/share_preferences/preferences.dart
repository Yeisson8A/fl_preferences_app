import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  // Obtener instancia de las preferencias
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Obtener valor de la preferencia (Name)
  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  // Guardar valor de la preferencia (Name)
  static set name(String name) {
    _name = name;
    _prefs.setString('name', _name);
  }

  // Obtener valor de la preferencia (Is Dark Mode)
  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  // Guardar valor de la preferencia (Is Dark Mode)
  static set isDarkmode(bool isDarkmode) {
    _isDarkmode = isDarkmode;
    _prefs.setBool('isDarkmode', _isDarkmode);
  }

  // Obtener valor de la preferencia (Gender)
  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  // Guardar valor de la preferencia (Gender)
  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', _gender);
  }
}