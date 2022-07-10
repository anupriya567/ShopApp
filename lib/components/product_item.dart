import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context, listen: false);
    Cart cartitem = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed('/product_details', arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.orange[500],
            ),
            onPressed: () {
              cartitem.addProduct(product.id, product.title, product.price);
              final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
                  GlobalKey<ScaffoldMessengerState>();
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                key: scaffoldMessengerKey,
                content: Text('Added item to cart!'),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    cartitem.removeProduct(product.id);
                  },
                ),
              ));
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Product>(
            builder: (context, product, child) => IconButton(
              icon: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.orange[500]),
              onPressed: () {
                Provider.of<Product>(context, listen: false).toggleIsFavorite();
              },
            ),
          ),
        ),
      ),
    );
  }
}
