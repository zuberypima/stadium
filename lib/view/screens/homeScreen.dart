import 'package:flutter/material.dart';
import 'package:stadium/constants/constants.dart';
import 'package:stadium/view/screens/addDataTofirebase.dart';
import 'package:stadium/view/screens/games.dart';
import 'package:stadium/view/screens/myticketsPage.dart';
import 'package:stadium/view/screens/profileScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

int _selectedIndex = 1;
List<Widget> screenList = [
  MyTicketsPage(),
  GamesPage(),
  ProfileScreen(),
];

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(176, 76, 175, 79),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online), label: "Tickets"),
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_basketball_rounded), label: "Games"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          nextPageNavigation(context, AddDataScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
