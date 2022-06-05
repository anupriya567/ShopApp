import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get cartitems {
    return {..._items};
  }

  int get clength {
    return _items.length;
  }

  void addProduct(String id, String title, double price) {
    if (_items.containsKey(id)) {
      _items.update(
          id,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          id,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price));
    }
    notifyListeners();
  }

  double get TotalPrice {
    double total = 0.0;
    _items.forEach(
      (id, cartItems) => total += (cartItems.price * cartItems.quantity),
    );
    return total;
  }

  void removeProduct(String id) {

    print(_items[id]!.quantity);
    if (_items[id] != null) {
      if (_items[id]!.quantity == 1) {
        _items.remove(id);
        notifyListeners();
      }
      else {
        _items.update(
            id,
                (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity - 1,
                price: existingCartItem.price)
        );
        notifyListeners();
      }
    }

    print("deleted");
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
