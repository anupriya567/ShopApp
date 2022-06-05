import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier
{
  final String title;
  final String id;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;

  Product({ required this.title, required this.id,required this.price, required this.description, required this.imageUrl, this.isFavourite = false});

  void toggleIsFavorite()
  {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}

