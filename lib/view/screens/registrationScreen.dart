import 'package:flutter/material.dart';
import 'package:stadium/services/authenticationService.dart';
import 'package:stadium/view/screens/loginpage.dart';
import 'package:stadium/view/widgets/formfieldOne.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

TextEditingController _fullName = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _password = TextEditingController();

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
            SizedBox(
              height: 20,
            ),
            Text("Full Name"),
            formFielOne("Alex Mgaya", _fullName, false),
            SizedBox(
              height: 10,
            ),
            Text("Email Address"),
            formFielOne("alex@email.com", _emailController, false),
            SizedBox(
              height: 10,
            ),
            Text("Password"),
            formFielOne("Password", _password, true),
            SizedBox(
              height: 5,
            ),
            Text("Confirm"),
            formFielOne("Password", _password, true),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.green),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () {
                      Authenticationservice().CreateUserWithEmailAndPassword(
                          _emailController.text, _password.text);
                    },
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
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage()));
                      },
                      child: Text("Login"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
