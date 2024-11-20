import 'package:flutter/material.dart';
import 'main_page.dart';
import 'settings_page.dart';
import 'add_book_page.dart';
import 'book_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(), // Light theme
      darkTheme: ThemeData.dark(), // Dark theme
      home: MainPage(
        isDarkMode: _isDarkMode,
        toggleDarkMode: _toggleDarkMode,
      ),
    );
  }

  // This function is to change the theme when toggling the switch
  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkMode = value;
    });
  }
}
