import 'package:flutter/material.dart';
import 'package:product_cart/constants/constants.dart';
import 'package:product_cart/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text("Favorites"),
    );
  }

  Widget _buildUI() {
    return Consumer<WishListProvider>(builder: (context, provider, _) {
      return Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.80,
            child: ListView.builder(
              itemBuilder: (context, index) {
                Product product = provider.items[index];
                bool isInWishList = provider.items.contains(product);
                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(product.imagepath))),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      provider.remove(product);
                    },
                    child: Icon(
                      Icons.delete,
                      color: isInWishList
                          ? Colors.red
                          : Colors.black, // Change color based on cart status
                    ),
                  ),
                  title: Text(product.name),
                  onLongPress: () {
                    provider.remove(product);
                  },
                );
              },
              itemCount: provider.items.length,
            ),
          ),
        ],
      );
    });
  }
}
