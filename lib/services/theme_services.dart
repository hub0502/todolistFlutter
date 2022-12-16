import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // _box라는 storage의 key 값에 'isDarkMode'라는 값이 null이면 false를 반환
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  // _loadThemeFromBox에 값이 false 즉 dark모드가 아닐때 다크모드로 바꾸고 true일 때는 light모드로 변경
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
}
