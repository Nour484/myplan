import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier {
  bool _lightMode = false;

  bool get lightModel => _lightMode;

  set lightModel(bool value) {
    _lightMode = value;
  }

  void changeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    _lightMode ? _lightMode = false : _lightMode = true;
    prefs.setBool("mode", _lightMode);
    notifyListeners();
  }

  getTheme() async {


    final prefs =   await SharedPreferences.getInstance();

    lightModel =prefs.getBool("mode") ?? true ;

 notifyListeners();






  }
}
