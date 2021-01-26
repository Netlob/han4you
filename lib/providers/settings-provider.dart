import 'package:flutter/material.dart';
import 'package:han4you/models/xedule/group.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ThemeMode themeMode = ThemeMode.light;
  List<Group> followingGroups = [];

  SettingsProvider() {
    initSettings();
  }

  void initSettings() async {
    final prefs = await _prefs;
    final themeMode =
        prefs.getBool("darkTheme") ?? false ? ThemeMode.dark : ThemeMode.light;
    setThemeMode(themeMode);
  }

  void setThemeMode(ThemeMode newMode) async {
    themeMode = newMode;
    notifyListeners();

    final prefs = await _prefs;
    prefs.setBool("darkTheme", themeMode == ThemeMode.dark);
  }

  void updateFollowingGroups(List<Group> groups) {
    followingGroups = groups;
    notifyListeners();
  }
}
