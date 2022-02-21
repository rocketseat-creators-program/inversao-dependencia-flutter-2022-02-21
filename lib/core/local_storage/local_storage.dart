import 'package:shared_preferences/shared_preferences.dart';

abstract class ILocalStorage {
  Future<void> setString({required String key, required String value});
  Future<void> setInt({required String key, required int value});
  Future<void> setBool({required String key, required bool value});
  Future<void> setDouble({required String key, required double value});

  String getString({required String key});
  int getInt({required String key});
  bool getBool({required String key});
  double getDouble({required String key});
}

class LocalStorage implements ILocalStorage {
  final SharedPreferences _preferences;

  LocalStorage({required SharedPreferences preferences})
      : _preferences = preferences;

  @override
  bool getBool({required String key}) {
    return _preferences.getBool(key) ?? false;
  }

  @override
  double getDouble({required String key}) {
    return _preferences.getDouble(key) ?? 0.0;
  }

  @override
  int getInt({required String key}) {
    return _preferences.getInt(key) ?? 0;
  }

  @override
  String getString({required String key}) {
    return _preferences.getString(key) ?? '';
  }

  @override
  Future<void> setBool({required String key, required bool value}) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<void> setDouble({required String key, required double value}) async {
    await _preferences.setDouble(key, value);
  }

  @override
  Future<void> setInt({required String key, required int value}) async {
    await _preferences.setInt(key, value);
  }

  @override
  Future<void> setString({required String key, required String value}) async {
    await _preferences.setString(key, value);
  }
}
