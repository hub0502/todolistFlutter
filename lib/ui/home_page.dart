import 'package:flutter/material.dart';
import 'package:flutter_application_todolist/services/theme_services.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: [Text("Theme Data", style: TextStyle(fontSize: 30))],
        ));
  }
}

_appBar() {
  final s = GetStorage();
  return AppBar(
    leading: GestureDetector(
      onTap: () {
        ThemeService().switchTheme();
      },
      child: Icon(
        Icons.nightlight_round,
        size: 20,
      ),
    ),
    actions: [
      Icon(
        Icons.person,
        size: 20,
      ),
      SizedBox(width: 20),
    ],
  );
}
