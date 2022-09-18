import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/profile_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, left: 20),
            alignment: Alignment.centerLeft,
            color: Colors.black87,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white70,
                child: Icon(Icons.person),
              ),
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 27,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Log Out',
                ),
              ),
              trailing: Text('                             '),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Home',
            Icons.home,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Profile',
            Icons.verified_user,
            () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
