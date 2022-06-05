import 'package:flutter/cupertino.dart';
import 'package:myshop/providers/cart.dart';
import 'package:provider/provider.dart';

// import '';
class OrderItem {
  final List<CartItem> items;
  final double amount;
  final String id;
  final DateTime dateTime;
  OrderItem(
      {required this.amount,
      required this.items,
      required this.id,
      required this.dateTime});
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void placeOrder(List<CartItem> items, double total) {
    _orders.insert(
        0,
        OrderItem(
            items: items,
            amount: total,
            id: UniqueKey().toString(),
            dateTime: DateTime.now()));
  }

}
