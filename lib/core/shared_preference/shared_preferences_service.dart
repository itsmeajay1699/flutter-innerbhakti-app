import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static final SharedPreferencesService _instance =
      SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;

  SharedPreferences? _prefs;

  SharedPreferencesService._internal();

  /// Initialize before using the service
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // ---------------------------
  // Basic Types
  // ---------------------------

  Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  Future<void> setInt(String key, int value) async {
    await _prefs?.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs?.getInt(key);
  }

  Future<void> setBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }

  Future<void> setDouble(String key, double value) async {
    await _prefs?.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _prefs?.getDouble(key);
  }

  // ---------------------------
  // JSON Handling
  // ---------------------------

  Future<void> setJson(String key, Map<String, dynamic> jsonMap) async {
    final jsonString = jsonEncode(jsonMap);
    await _prefs?.setString(key, jsonString);
  }

  Map<String, dynamic>? getJson(String key) {
    final jsonString = _prefs?.getString(key);
    if (jsonString == null) return null;

    try {
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  dynamic getJsonField(String key, String field) {
    final json = getJson(key);
    return json?[field];
  }

  // ---------------------------
  // Utility Methods
  // ---------------------------

  Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  Future<void> clearAll() async {
    await _prefs?.clear();
  }

  bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }
}
