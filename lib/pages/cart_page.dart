import 'package:flutter/material.dart';
import 'package:product_cart/constants/constants.dart';
import 'package:product_cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Cart"),
    );
  }

  Widget _buildUI() {
    return Consumer<CartProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.80,
            child: ListView.builder(
              itemBuilder: (context, index) {
                Product product = provider.items[index];
                return ListTile(
                  title: Text(product.name),
                  onLongPress: () {
                    provider.remove(product);
                  },
                );
              },
              itemCount: provider.items.length,
            ),
          ),
          Text("Cart Total : ${provider.getCartTotal()}")
        ],
      );
    });
  }
}
