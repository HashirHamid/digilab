import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/diagnosis_screen.dart';

import '../widgets/main_drawer.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {'page': DiagnosisScreen(), 'title': 'Diagnosis'},
      {'page': HomeScreen(), 'title': 'Home'},
      {'page': SettingsScreen(), 'title': 'Settings'},
    ];
    super.initState();
  }

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).canvasColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.medical_services),
            label: 'Diagnosis',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
