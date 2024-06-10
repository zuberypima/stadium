import 'package:flutter/material.dart';

Widget formFielOne(String hintText){
  return Container(
    child: TextFormField(
      decoration: InputDecoration(
        hintText:hintText ,
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder()
      ),
    ));
}