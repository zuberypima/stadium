import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stadium/view/allSeetView.dart';
import 'package:stadium/view/screens/addDataTofirebase.dart';
import 'package:stadium/view/screens/homeScreen.dart';
import 'package:stadium/view/screens/loginpage.dart';
import 'package:stadium/view/screens/registrationScreen.dart';
import 'package:stadium/view/seetViewPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyC9PtWCgmyHUoTYXTOLYz7KzWoMWFQfAX4",
    appId: "1:568287323336:android:e957fe1372a433aefc71fd",
    messagingSenderId: "568287323336",
    projectId: "stadium-37525",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home:AllseatView() ,
    );
  }
}
