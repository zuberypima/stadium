import 'package:flutter/material.dart';

Color mainbackgroundColor =Colors.greenAccent;
Color  mainSecondaryColor =const Color.fromARGB(97, 0, 0, 0);

Color textColorOne = Colors.white;


nexpageNavigation(context,Widget nextPage){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>nextPage));
}