import 'package:flutter/material.dart';
import 'package:product_cart/constants/constants.dart';
import 'package:product_cart/providers/cart_provider.dart';
import 'package:product_cart/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Products"),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: const Icon(
              Icons.shopping_cart,
            )),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wishlist");
            },
            icon: const Icon(
              Icons.favorite_outline,
            ))
      ],
    );
  }

  Widget _buildUI(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    WishListProvider wishProvider = Provider.of<WishListProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the cross axis count as needed
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: PRODUCTS.length,
          itemBuilder: (context, index) {
            Product product = PRODUCTS[index];
            return GridTile(
              child: Column(children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.imagepath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    product.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      if (cartProvider.items.contains(product)) {
                        cartProvider.remove(product);
                      } else {
                        cartProvider.add(product);
                      }
                    },
                    child: Icon(
                      Icons.shopping_cart,
                      color: cartProvider.items.contains(product)
                          ? Colors.green
                          : Colors.black,
                    ),
                  ),
                  leading: GestureDetector(
                    onTap: () {
                      if (wishProvider.items.contains(product)) {
                        wishProvider.remove(product);
                      } else {
                        wishProvider.add(product);
                      }
                    },
                    child: Icon(
                      Icons.favorite,
                      color: wishProvider.items.contains(product)
                          ? Colors.red
                          : Colors.black,
                    ),
                  ),
                ),
              ]),
            );
          }),
    );
  }
}
