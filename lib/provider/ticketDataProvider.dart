import 'package:flutter/material.dart';

class TicketDataProvider extends ChangeNotifier {
  int _listInCart = 0;

  int get listInCart => _listInCart;

  void getLiskInCart(int numberInCat) {
    _listInCart = numberInCat;
    print("Here is "+_listInCart.toString());
    notifyListeners();
  }
}
