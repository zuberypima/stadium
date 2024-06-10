import 'package:flutter/material.dart';
import 'package:stadium/view/screens/loginpage.dart';
import 'package:stadium/view/widgets/formfieldOne.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Register your account"),
            SizedBox(height: 20,),
            Text("Email Address"),
            formFielOne("user@email.com"),
            SizedBox(
              height: 10,
            ),
            Text("Phone Number"),
            formFielOne("0782 766 567"),
            SizedBox(
              height: 10,
            ),
            Text("Password"),
            formFielOne("Password"),
            SizedBox(
              height: 5,
            ),
            Text("Confirm"),
            formFielOne("Password"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () {},
                    child: Text("Register"))),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I already have an Account"),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
                  }, child: Text("Login"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
