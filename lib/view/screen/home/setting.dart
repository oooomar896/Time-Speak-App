import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الإعدادات")),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildSwitchTile("الوضع الليلي", _isDarkMode, (value) {
            setState(() {
              _isDarkMode = value;
            });
          }),
          _buildSwitchTile("الإشعارات قبل انتهاء الوقت", true, (value) {}),
          _buildSlider("الحد الأقصى للوقت", 20.0, (value) {}),
        ],
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(title),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }

  Widget _buildSlider(String title, double value, Function(double) onChanged) {
    return ListTile(
      title: Text(title),
      subtitle: Slider(
        value: value,
        min: 10,
        max: 60,
        onChanged: onChanged,
      ),
    );
  }
}
