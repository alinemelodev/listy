import 'package:listy/models/product_category.dart';

class Product {
  String name;
  String quantity;
  ProductCategory category;

  Product({required this.name, required this.quantity, required this.category});
}
