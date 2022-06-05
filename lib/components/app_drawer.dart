import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Guys'),
            // automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop, size: 30,),
            title: Text('Shop',style: TextStyle(
              fontSize: 20
            ),),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, size: 30),
            title: Text('Orders',style: TextStyle(
    fontSize: 20)),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/orders_screen');
            },
          ),
        ],
      ),
    );
  }
}
