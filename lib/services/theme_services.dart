import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  // 함수로 parameter에 bool 값을 주면 box에 'isDarkMode'라는 키에 bool 값을 넣는다.
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  // _box라는 storage의 key 값에 'isDarkMode'라는 값이 null이면 false를 반환
  bool _loadThemeFromBox() => _box.read(_key) ?? false;

  // _loadThemeFromBox에 값이 false 즉 dark모드가 아닐때 다크모드로 바꾸고 true일 때는 light모드로 변경
  // 이 변수는 ThemeMode에서 참조하기 위해 만들어진 변수
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    // storage에 isDarkMode가 true이면 light, false이면 dark
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);

    // 반대 값을 넣어줘서 껏다 킴
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
