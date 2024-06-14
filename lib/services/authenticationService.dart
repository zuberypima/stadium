import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadium/constants/constants.dart';
import 'package:stadium/view/screens/homeScreen.dart';

class Authenticationservice {
  Future<void> CreateUserWithEmailAndPassword(
      String emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((context) {
        nextPageNavigation(context, Homescreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signinUserWithEmailAndPassword(
      String emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((context) {
        nextPageNavigation(context, Homescreen());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }


   Future<void> addUserDetailToDataBase(String emailAddress,fullname) {
    return FirebaseFirestore.instance.collection('UsersDetails').doc(emailAddress).set({
      "UserName": fullname,
      "Email": emailAddress
    });
  }


   Future<void> userPaymentMethod(String emailAddress,_phoneNumber) {
    return FirebaseFirestore.instance.collection('UsersDetails').doc(emailAddress).collection(_phoneNumber).doc(_phoneNumber).set({
      "PhoneNumber": _phoneNumber,
      "Ammount": "600000"
    });
  }
}
