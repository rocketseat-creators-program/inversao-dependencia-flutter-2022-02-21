import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/local_storage/local_storage.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    preferences: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({Key? key, required this.preferences}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(
        localStorage: LocalStorage(preferences: preferences),
      ),
    );
  }
}
