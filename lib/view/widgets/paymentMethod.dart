import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stadium/services/authenticationService.dart';
import 'package:stadium/view/widgets/formfieldOne.dart';

class AddPaymentMetho extends StatefulWidget {
  const AddPaymentMetho({super.key});

  @override
  State<AddPaymentMetho> createState() => _AddPaymentMethoState();
}

class _AddPaymentMethoState extends State<AddPaymentMetho> {
  TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Payment Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("Enter Phone Number Used for Payments"),
            ),
            formFielOne("0718934183", _phoneNumber, false),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.lightBlue),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () {
                  Authenticationservice().userPaymentMethod('alexmm@g.com', _phoneNumber.text);
                  Navigator.pop(context);
                },
                child: Text("Add This Number"))
          ],
        ),
      ),
    );
  }
}
