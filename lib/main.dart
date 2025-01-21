import 'package:flutter/material.dart';
import 'package:listy/models/product_categories.dart';
import 'package:listy/models/products.dart';
import 'package:listy/screens/product_categories_screen.dart';
import 'package:listy/screens/products_screen.dart';
import 'package:listy/themes/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Products(products: [])),
      ChangeNotifierProvider(
          create: (context) => ProductCategories(categories: [])),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listy',
      debugShowCheckedModeBanner: false,
      theme: MyTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductsScreen(title: 'Produtos'),
        '/categories': (context) =>
            const ProductCategoriesScreen(title: 'Categorias'),
      },
    );
  }
}
