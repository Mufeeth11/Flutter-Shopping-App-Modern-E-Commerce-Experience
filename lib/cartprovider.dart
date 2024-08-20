import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  void add(Map<String, dynamic> product) {
    if (cart.isEmpty != true) {
      bool temp = cart.any(
        (map) {
          if (map['title'] == product["title"] &&
              map['Size'] == product['Size']) {
            return true;
          }
          return false;
        },
      );
      if (temp) {
        for (int i = 0; i < cart.length; i++) {
          if (cart[i]['Size'] == product['Size']) {
            cart[i] = product;
            notifyListeners();
          }
        }
      } else {
        cart.add(product);
        notifyListeners();
      }
    } else {
      cart.add(product);
      notifyListeners();
    }
  }

  void remove(Map<String, dynamic> product) {
    cart.remove(product);
    notifyListeners();
  }

  void clearAll() {
    cart.clear();
    notifyListeners();
  }
}
