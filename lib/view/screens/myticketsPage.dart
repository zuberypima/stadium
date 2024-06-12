import 'package:flutter/material.dart';
import 'package:stadium/view/screens/ticketsBook.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({super.key});

  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
        ),
        body:Center(child: Text("My Tickets"),)
      ),
    );
  }
}
