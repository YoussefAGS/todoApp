import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class prefHandlar {
  static SharedPreferences? pref;

  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static savetheme(ThemeMode themeMode) async {
    await pref?.setString(
        "theme", themeMode == ThemeMode.light ? "light" : "dark");
  }

  static ThemeMode gettheme() {
    String themeMode = pref?.getString('theme') ?? "light";
    return themeMode == 'light' ? ThemeMode.light : ThemeMode.dark;
  }
}
