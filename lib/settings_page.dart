import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final Function(bool) toggleDarkMode;
  final bool isDarkMode;

  const SettingsPage(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: isDarkMode, // Use the current theme state
              onChanged: toggleDarkMode, // Toggle the theme mode
            ),
          ],
        ),
      ),
    );
  }
}
