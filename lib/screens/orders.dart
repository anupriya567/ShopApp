import 'package:flutter/material.dart';
import 'package:myshop/components/order_listTile.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/orders.dart';
import 'package:myshop/components/app_drawer.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),

      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return OrderListTile(order: orderData.orders[index]);
        },
        itemCount: orderData.orders.length,
      ),
    );
  }
}
