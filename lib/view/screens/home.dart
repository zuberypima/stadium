import 'package:flutter/material.dart';
import 'package:stadium/view/screens/ticketsBook.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text("Regular"),
              ),
              Tab(
                child: Text("Standard"),
              ),
              Tab(
                child: Text("VIP-B"),
              ),
              Tab(
                child: Text("VIP-A"),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TicketsbookView(pageLabele: "Regula Tickets"),
            TicketsbookView(pageLabele: "Standard Tickets"),
            TicketsbookView(pageLabele: "VIP-B Tickets"),
            TicketsbookView(pageLabele: "VIP-A Tickets"),
          ],
        ),
      ),
    );
  }
}
