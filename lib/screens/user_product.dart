import 'package:flutter/material.dart';
import 'package:myshop/components/user_product_listTile.dart';
import 'package:myshop/providers/products.dart';
import 'package:provider/provider.dart';
import 'package:myshop/components/app_drawer.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("hello");
    var productData = Provider.of<Products>(context);
    print(productData.AllProducts.length);
    return Scaffold(
        appBar: AppBar(
          title: Text("Manage Products"),
          actions: [IconButton(onPressed: () {
            Navigator.pushNamed(context, '/editScreen');
          }, icon: Icon(Icons.add))],
        ),
        drawer: AppDrawer(),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productData.AllProducts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  UserProductTile(
                    title: productData.AllProducts[index].title,
                    imageurl: productData.AllProducts[index].imageUrl,
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ));
  }
}
