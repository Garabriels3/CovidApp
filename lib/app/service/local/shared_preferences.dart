import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesCache {
  // SET DATA
  addStringToSF(String key, String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, data);
  }

  addIntToSF(String key, int data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, data);
  }

  addDoubleToSF(String key, double data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(key, data);
  }

  addBoolToSF(String key, bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, data);
  }

  // GET DATA
  Future<String> getStringToSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<int> getIntToSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  Future<double> getDoubleToSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key);
  }

  Future<bool> getBoolToSF(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
