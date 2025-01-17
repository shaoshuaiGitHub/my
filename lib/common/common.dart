import 'package:flutter/material.dart';

class Constant {
  static const String SERVER_ADDRESS = "http://yxb.xiansuoapp.com/";
  // static const String SERVER_ADDRESS = "http://110.83.28.113:12399/";
  // static const String SERVER_ADDRESS = "http://47.111.171.71/";
  // static const String SERVER_ADDRESS = "http://192.168.1.185/xiaobin/";
  static const int SUCCESS_CODE = 20000;
  static const String keyLanguage = 'key_language';
  static const String KEY_THEME_COLOR = 'key_theme_color';
  static const String KEY_GUIDE = 'key_guide';
  static const String KEY_SPLASH_MODEL = 'key_splash_models';
}

class AppConfig {
  static const bool isDebug = false;
  static const String appName = '优信保';
  static const String version = '0.0.1';
  static const MaterialColor defaultColor = Colors.blue;
}
