import 'package:flutter/material.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/screens/edit_product.dart';
import 'package:myshop/screens/product_details.dart';
import 'package:myshop/screens/user_product.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'screens/product_overview.dart';
import 'package:myshop/providers/products.dart';
import 'package:myshop/providers/cart.dart';
import 'package:myshop/screens/cart.dart';
import 'package:myshop/providers/orders.dart';
import 'package:myshop/screens/orders.dart';


void main() {
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) =>  Cart()),
        ChangeNotifierProvider(create: (context) =>  Order()),
    ],
      child: MaterialApp(
        title: 'ShopApp',
        theme: ThemeData(
          fontFamily: 'SourceSansPro', colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey).copyWith(secondary: Colors.blueGrey[600]),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductOverview(),
          '/product_details': (context) => ProductDetails(),
          '/cart_screen': (context) => CartScreen(),
          '/orders_screen': (context) => OrderScreen(),
          '/userproduct_screen': (context) => UserProductScreen(),
          '/editScreen': (context) =>EditScreen(),

        },
      ),
    );
  }
}
