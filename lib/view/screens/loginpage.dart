import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stadium/view/screens/homeScreen.dart';
import 'package:stadium/view/screens/registrationScreen.dart';
import 'package:stadium/view/widgets/formfieldOne.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
TextEditingController _emailController = TextEditingController();
TextEditingController _password = TextEditingController();
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email Address"),
            formFielOne("User@email.com",_emailController,false),
            SizedBox(
              height: 10,
            ),
            Text("Password"),
            formFielOne("Password",_password,true),
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Homescreen()));
                    },
                    child: Text("Login"))),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I dont have an Account"),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegistrationPage()));
                      },
                      child: Text("Register"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
