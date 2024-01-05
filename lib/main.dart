import 'package:flutter/material.dart';
import 'package:product_cart/pages/cart_page.dart';
import 'package:product_cart/pages/product_page.dart';
import 'package:product_cart/pages/wishlist.dart';
import 'package:product_cart/providers/cart_provider.dart';
import 'package:product_cart/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ListenableProvider<CartProvider>(create: (context) => CartProvider()),
    ListenableProvider<WishListProvider>(
        create: (context) => WishListProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/products",
      routes: {
        "/products": (context) => ProductPage(),
        "/cart": (context) => CartPage(),
        "/wishlist": (context) => WishListPage(),
      },
    );
  }
}
