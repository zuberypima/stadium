import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadium/services/dataservices.dart';

class SeatLayout extends StatefulWidget {
  const SeatLayout({super.key});

  @override
  State<SeatLayout> createState() => _SeatLayoutState();
}

class _SeatLayoutState extends State<SeatLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Seal Layout",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: DataService().fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No Data Found'));
            } else {
              List<Map<String, dynamic>> data = snapshot.data!;
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 3 / 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item = data[index];
                  return Card(
                    color: item['Status']=='Available'?Colors.grey:Colors.green,
                    child: Column(
                      children: [
                        Icon(Icons.chair),
                        Text(item['SetatNo']),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
