import 'package:flutter/material.dart';
import 'package:stadium/constants/constants.dart';
import 'package:stadium/view/screens/paymentList.dart';
import 'package:stadium/view/widgets/profileCard.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello"),
          
        ),
        body: ListView(
          children: [
            profileCardWidget('Notifications',Icons.notifications_none),
            InkWell(
              onTap: () {
                nextPageNavigation(context, PaymentMethodLis());
              },
              child: profileCardWidget('Payments',Icons.payment)),
            profileCardWidget('Settings',Icons.settings),
            profileCardWidget('Help & info',Icons.help),
          ],
        ),
      ),
    );
  }
}
 