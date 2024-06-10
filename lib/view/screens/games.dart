import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadium/constants/constants.dart';
import 'package:stadium/services/dataservices.dart';
import 'package:stadium/view/widgets/gameListView.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({super.key});

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              bottom: TabBar(
                tabs: [
                    Tab(
                    child: Column(
                      children: [
                        Text(DateTime.now().day.toString()+'/' +DateTime.now().month.toString()),
                        // Text(DateTime.now().toString()),
                       
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      children: [
                        Text(DateTime.now().day.toString()+'/' +DateTime.now().month.toString()),
                        // Text(DateTime.now().toString()),
                       
                      ],
                    ),
                  ),
                   Tab(
                    child: Column(
                      children: [
                        Text(DateTime.now().day.toString()+'/' +DateTime.now().month.toString()),
                        // Text(DateTime.now().toString()),
                      
                      ],
                    ),
                  ),
                   Tab(
                    child: Column(
                      children: [
                        Text(DateTime.now().day.toString()+'/' +DateTime.now().month.toString()),
                        // Text(DateTime.now().toString()),
                        
                      ],
                    ),
                  ),
                
                ],
              ),
            ),
            backgroundColor: mainbackgroundColor,
            body: TabBarView(children: [
              gameListView(),              gameListView(),
              gameListView(),
              gameListView(),

            ],)
            //  StreamBuilder<QuerySnapshot>(
            //     stream:
            //         FirebaseFirestore.instance.collection('Games').snapshots(),
            //     builder: (BuildContext context,
            //         AsyncSnapshot<QuerySnapshot> snapshot) {
            //       if (snapshot.hasError) {
            //         return Text('Something went wrong');
            //       }

            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       }

            //       return ListView(
            //         children:
            //             snapshot.data!.docs.map((DocumentSnapshot document) {
            //           Map<String, dynamic> data =
            //               document.data()! as Map<String, dynamic>;
            //           return Card(
            //             color: mainSecondaryColor,
            //             child: ListTile(
            //               title: Text(
            //                 data['HomeTeam'],
            //                 style: TextStyle(color: textColorOne),
            //               ),
            //               subtitle: Text(data['AwayTeam'],
            //                   style: TextStyle(color: textColorOne)),
            //             ),
            //           );
            //         }).toList(),
            //       );
            //     })
                ),
      ),
    );
  }
}
