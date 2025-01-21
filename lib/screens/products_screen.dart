import 'package:flutter/material.dart';
import 'package:listy/components/custom_floating_action_button.dart';
import 'package:listy/components/main_drawer.dart';
import 'package:listy/models/product.dart';
import 'package:listy/models/product_categories.dart';
import 'package:listy/models/product_category.dart';
import 'package:listy/models/products.dart';
import 'package:listy/themes/app_colors.dart';
import 'package:listy/themes/app_texts.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purpleColor,
        title: Text(
          widget.title,
          style: AppTexts.titlePage,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      drawer: const MainDrawer(),
      body: Consumer<Products>(
        builder: (BuildContext context, Products list, Widget? widget) {
          return ListView.builder(
            itemCount: list.products.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                child: ListTile(
                  leading: Icon(list.products[index].category.icon),
                  title: Text(
                    list.products[index].name,
                    style: AppTexts.baseText,
                  ),
                  trailing: Text(
                    list.products[index].quantity,
                    style: AppTexts.baseText,
                  ),
                  iconColor: AppColors.purpleColor,
                ),
                onDismissed: (direction) {
                  list.remove(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: CustomFloatingActionButton(
        context: context,
        color: AppColors.purpleColor,
        onPressed: () {
          createProduct(context);
        },
      ),
    );
  }

  void createProduct(context) {
    TextEditingController nomeInput = TextEditingController();
    TextEditingController quantityInput = TextEditingController();
    ProductCategories listCategories =
        Provider.of<ProductCategories>(context, listen: false);
    ProductCategory dropdownValue = listCategories.categories[0];
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            scrollable: true,
            title: const Text('Adicionar produto'),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: nomeInput,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, preencha o campo';
                        }
                        return null;
                      },
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    TextFormField(
                      controller: quantityInput,
                      decoration: const InputDecoration(
                        labelText: 'Quantidade',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return DropdownButton(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        style: const TextStyle(
                            color: AppColors.greenColor, fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: AppColors.greenColor,
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            dropdownValue = newValue as ProductCategory;
                          });
                        },
                        items: listCategories.categories
                            .map((ProductCategory category) {
                          return DropdownMenuItem<ProductCategory>(
                            value: category,
                            child: Text(category.name),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ),
              ),
            ),
            actions: [
              Consumer<Products>(builder:
                  (BuildContext context, Products list, Widget? widget) {
                return TextButton(
                    child: const Text("Salvar"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        list.add(Product(
                            name: nomeInput.text,
                            quantity: quantityInput.text,
                            category: dropdownValue));
                        Navigator.pop(context);
                      }
                    });
              }),
              TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }
}
