import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile-screen';

  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Nice profile :)'),
      ),
    );
  }
}
