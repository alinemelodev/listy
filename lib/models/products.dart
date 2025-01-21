import 'package:flutter/material.dart';
import 'package:listy/models/product.dart';

class Products extends ChangeNotifier {
  List<Product> products;

  Products({required this.products});

  void add(Product product) {
    products.add(product);
    notifyListeners();
  }

  void remove(int index) {
    products.removeAt(index);
    notifyListeners();
  }
}
