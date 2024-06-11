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
          // bottom: TabBar(
          //   tabs: [
          //     Tab(
          //       child: Text("Regular"),
          //     ),
          //     Tab(
          //       child: Text("Standard"),
          //     ),
          //     Tab(
          //       child: Text("VIP-B"),
          //     ),
          //     Tab(
          //       child: Text("VIP-A"),
          //     )
          //   ],
          // ),
        ),
        body:Center(child: Text("My Tickets"),)
        //  TabBarView(
        //   children: [
        //     TicketsbookView(pageLabele: "Regula Tickets"),
        //     TicketsbookView(pageLabele: "Standard Tickets"),
        //     TicketsbookView(pageLabele: "VIP-B Tickets"),
        //     TicketsbookView(pageLabele: "VIP-A Tickets"),
        //   ],
        // ),
      ),
    );
  }
}
