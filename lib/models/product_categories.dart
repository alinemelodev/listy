import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:listy/models/product_category.dart';

class ProductCategories extends ChangeNotifier {
  List<ProductCategory> categories;

  ProductCategories({required this.categories});

  void add(ProductCategory productCategory) {
    categories.add(productCategory);
    notifyListeners();
  }

  void remove(int index) {
    categories.removeAt(index);
    notifyListeners();
  }
}
