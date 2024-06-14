import 'package:flutter/material.dart';
import 'package:stadium/view/allSeatView.dart';
import 'package:stadium/view/widgets/seatLayout.dart';

Widget stadium_layout(context, category) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AllseatView()));
            },
            child: Text("North Side")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AllseatView()));
            },
            child: Text("Left Side")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AllseatView()));
            },
            child: Text("Right Side")),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AllseatView()));
            },
            child: Text("South Side"))
      ],
    ),
  );
}
