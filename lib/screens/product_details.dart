import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/products.dart';

class ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;

    Product p =
        Provider.of<Products>(context, listen: false).getProductByID(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(p.title),
        backgroundColor: Colors.blueGrey[500],
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  p.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${p.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  p.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
