import 'package:flutter/material.dart';

Widget accountBalanceContainer(context) {
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
          '50,000',
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
              width: MediaQuery.of(context).size.width/2,
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
