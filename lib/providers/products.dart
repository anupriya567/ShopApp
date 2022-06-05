import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/product.dart';


class Products with ChangeNotifier
{
  List<Product> _AllProducts = [Product(
    id: 'p1',
    title: 'Red Shirt',
    description: 'A red shirt - it is pretty red!',
    price: 30,
    imageUrl:
    'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
  ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 50,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 20,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 50,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),];

 List<Product> get AllProducts
 {
   return [..._AllProducts];
 }

  List<Product> get FavProducts
  {
    return _AllProducts.where((product) => product.isFavourite).toList();
  }
void addProduct(Product p)
{
  _AllProducts.add(p);
  notifyListeners();
}

Product getProductByID(String id)
{
  return _AllProducts.firstWhere((product) => product.id == id);
}

}