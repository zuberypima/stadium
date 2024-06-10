import 'package:flutter/material.dart';
import 'package:stadium/view/screens/games.dart';
import 'package:stadium/view/screens/home.dart';
import 'package:stadium/view/screens/profileScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int _selectedIndex = 1;
List<Widget> screenList = [
  GamesPage(),
  Home(),
  ProfileScreen(),
];

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball_rounded), label: "Games"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
