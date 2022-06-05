
// before using provider here Product
import 'package:flutter/material.dart';
import 'package:myshop/components/product_item.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/products.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<Product> ProductList = Provider.of<Products>(context).getProducts();
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopApp'),
        backgroundColor: Colors.blueGrey[700],
      ),
      backgroundColor: Colors.blue[50],
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: ProductList.length,
          itemBuilder: (context, i) => ProductItem(
            imageUrl: ProductList[i].imageUrl, title: ProductList[i].title, id: ProductList[i].id,),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ),
      ),
    );
  }
}
