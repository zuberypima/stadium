import 'package:flutter/material.dart';

Widget accountDetailsContainer(context) {
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
          'Zubery Pima',
          style: TextStyle(fontSize: 15),
        )
      ],
    ),
  );
}
