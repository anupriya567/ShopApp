import 'package:flutter/material.dart';
import '../components/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:myshop/providers/cart.dart';
import '../components/app_drawer.dart';

enum FilterOptions {
  ShowAll,
  OnlyFavourites,
}
bool _filterselected = false;

class ProductOverview extends StatefulWidget {
  const ProductOverview({Key? key}) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  @override
  Widget build(BuildContext context) {
    final ProductData = Provider.of<Products>(context, listen: false);
    final ProductList =
        _filterselected ? ProductData.FavProducts : ProductData.AllProducts;

    return Scaffold(
      appBar: AppBar(
        title: Text('ShopApp'),
        actions: [
          Consumer<Cart>(
            builder: (key, cartitems, child) => Badge(
              badgeColor: Colors.orange,
              toAnimate: true,
              position: BadgePosition.topEnd(top: 4, end: 2),
              borderRadius: BorderRadius.circular(6),
              badgeContent: Text(cartitems.clength.toString()),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart_screen');
                },
                icon: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
          ),
          PopupMenuButton(
              onSelected: (FilterOptions selectedFilter) {
                setState(() {
                  if (selectedFilter == FilterOptions.OnlyFavourites) {
                    _filterselected = true;
                  } else {
                    _filterselected = false;
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('Only Favourites'),
                        value: FilterOptions.OnlyFavourites),
                    PopupMenuItem(
                        child: Text('Show All'), value: FilterOptions.ShowAll)
                  ])
        ],
        backgroundColor: Colors.blueGrey[700],
      ),
      backgroundColor: Colors.blue[50],
      drawer: AppDrawer(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: ProductList.length,
          itemBuilder: (context, i) => ChangeNotifierProvider.value(
            value: ProductList[i],
            child: ProductItem(),
          ),
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
