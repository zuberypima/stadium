import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Widget accountBalanceContainer(context) {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  return FutureBuilder<DocumentSnapshot>(
    future: FirebaseFirestore.instance
        .collection("UsersDetails")
        .doc(_auth.currentUser!.email)
        .collection('0718934183')
        .doc('0718934183')
        .get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return balanceContainer(context,'0.00');
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return balanceContainer(context, data['Ammount']);
      }

      return Text("loading");
    },
  );
}

Widget balanceContainer(context,String balance) {
  return Container(
    // color: Colors.amber,
    height: MediaQuery.of(context).size.height / 5,
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Balance',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        SizedBox(height: 3),
        Text(
          balance,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        const SizedBox(height: 3),
        Text(
          'Tsh',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 5),
        Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Colors.lightBlueAccent[100]),
                      foregroundColor: WidgetStatePropertyAll(Colors.black)),
                  onPressed: () {},
                  child: Text('Fund Account'))),
        )
      ],
    ),
  );
}
