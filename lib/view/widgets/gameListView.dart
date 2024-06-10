import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadium/constants/constants.dart';

Widget gameListView() {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Games').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Card(
              color: mainSecondaryColor,
              child: ListTile(
                title: Text(
                  data['HomeTeam'],
                  style: TextStyle(color: textColorOne),
                ),
                subtitle: Text(data['AwayTeam'],
                    style: TextStyle(color: textColorOne)),
              ),
            );
          }).toList(),
        );
      });
}
