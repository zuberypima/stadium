import 'package:flutter/material.dart';
import 'package:stadium/view/seetViewPage.dart';
import 'package:stadium/view/stadiumLayout.dart';
import 'package:stadium/view/widgets/layout.dart';

class TicketsbookView extends StatefulWidget {
  String pageLabele;
  TicketsbookView({super.key, required this.pageLabele});

  @override
  State<TicketsbookView> createState() => _TicketsbookViewState();
}

class _TicketsbookViewState extends State<TicketsbookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pageLabele),),
      body: stadium_layout(context)
    );
  }
}
