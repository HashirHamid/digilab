import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';

  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings'),
    );
  }
}
