import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:provider/provider.dart';
import 'package:myshop/components/cart_item_listTile.dart';
import 'package:myshop/providers/orders.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                      label: Text(
                        '\$${cart.TotalPrice}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .titleMedium
                                ?.color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  TextButton(
                    child: Text('ORDER NOW'),
                    onPressed: () {
                      Provider.of<Order>(context,listen: false).placeOrder(cart.cartitems.values.toList(), cart.TotalPrice);
                      cart.clearCart();
                      Navigator.pushNamed(context, '/order_screen');
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) {
                  var item = cart.cartitems.values.toList()[index];
                  return CartListTile(
                      title: item.title,
                      price: item.price,
                      quantity: item.quantity,
                  id : item.id,
                  prodid: cart.cartitems.keys.toList()[index]);
                },
                itemCount: cart.clength),
          )
        ],
      ),
    );
  }
}
