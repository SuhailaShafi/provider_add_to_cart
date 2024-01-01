import 'package:flutter/widgets.dart';
import 'package:product_cart/constants/constants.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => _items;
  void add(Product item) {
    items.add(item);
    notifyListeners();
  }

  void remove(Product item) {
    items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}
