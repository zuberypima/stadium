import 'package:flutter/material.dart';
import 'package:stadium/view/widgets/accountBalance.dart';
import 'package:stadium/view/widgets/accountDetails.dart';
import 'package:stadium/view/widgets/paymentDetails.dart';

class PaymentMethodLis extends StatefulWidget {
  const PaymentMethodLis({super.key});

  @override
  State<PaymentMethodLis> createState() => _PaymentMethodLisState();
}

class _PaymentMethodLisState extends State<PaymentMethodLis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bill & Payments"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: accountDetailsContainer(context),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: accountBalanceContainer(context),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: paymentDetails(context),
          )
        ],
      ),
    );
  }
}
