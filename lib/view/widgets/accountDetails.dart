import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadium/constants/constants.dart';
import 'package:stadium/view/screens/loginpage.dart';

Widget accountDetailsContainer(context) {
  final FirebaseAuth _auth =FirebaseAuth.instance;
  return FutureBuilder<DocumentSnapshot>(

    future:
        FirebaseFirestore.instance.collection("UsersDetails").doc(_auth.currentUser!.email).get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
        return Container(
          // color: Colors.amber,
          height: MediaQuery.of(context).size.height / 8,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'User not sign in',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              SizedBox(height: 3),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                          foregroundColor:
                              WidgetStatePropertyAll(Colors.white)),
                      onPressed: () {
                        nextPageNavigation(context, LoginPage());
                      },
                      child: Text("Sign in")))
            ],
          ),
        );
        ;
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Container(
          // color: Colors.amber,
          height: MediaQuery.of(context).size.height / 10,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Account',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
              ),
              SizedBox(height: 3),
              Text(
                data['UserName'].toString(),
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        );
        ;
      }

      return Text("loading");
    },
  );
}
