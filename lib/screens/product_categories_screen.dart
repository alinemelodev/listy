import 'package:flutter/material.dart';
import 'package:listy/components/custom_floating_action_button.dart';
import 'package:listy/components/icon_picker.dart';
import 'package:listy/components/main_drawer.dart';
import 'package:listy/models/product_categories.dart';
import 'package:listy/models/product_category.dart';
import 'package:listy/themes/app_colors.dart';
import 'package:listy/themes/app_texts.dart';
import 'package:provider/provider.dart';

class ProductCategoriesScreen extends StatefulWidget {
  const ProductCategoriesScreen({super.key, required this.title});

  final String title;

  @override
  State<ProductCategoriesScreen> createState() =>
      _ProductCategoriesScreenState();
}

class _ProductCategoriesScreenState extends State<ProductCategoriesScreen> {
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text(
          widget.title,
          style: AppTexts.titlePage,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      drawer: const MainDrawer(),
      body: Consumer<ProductCategories>(builder:
          (BuildContext context, ProductCategories list, Widget? widget) {
        return ListView.builder(
          itemCount: list.categories.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              background: Container(color: Colors.red),
              child: ListTile(
                leading: Icon(list.categories[index].icon),
                title: Text(
                  list.categories[index].name,
                  style: AppTexts.baseText,
                ),
                iconColor: AppColors.greenColor,
              ),
              onDismissed: (direction) {
                list.remove(index);
              },
            );
          },
        );
      }),
      floatingActionButton: CustomFloatingActionButton(
        context: context,
        color: AppColors.greenColor,
        onPressed: () {
          createCategory(context);
        },
      ),
    );
  }

  void createCategory(context) {
    TextEditingController nomeInput = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: const Text('Cadastrar categoria'),
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
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        children: [
                          const Padding(padding: EdgeInsets.all(5)),
                          selectedIcon != null
                              ? Icon(selectedIcon, color: AppColors.greenColor)
                              : const Text('Selecione um ícone'),
                          const Padding(padding: EdgeInsets.all(5)),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: AppColors.grayLightColor,
                                backgroundColor: AppColors.greenColor,
                                elevation: 5,
                              ),
                              onPressed: () async {
                                final IconData? result = await showIconPicker(
                                    context: context,
                                    defaultIcon: selectedIcon);
                                setState(() {
                                  selectedIcon = result;
                                });
                              },
                              child: const Text('Selecionar ícone'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Salvar"),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  selectedIcon ??= Icons.circle;
                  Provider.of<ProductCategories>(context, listen: false).add(
                    ProductCategory(
                      name: nomeInput.text,
                      icon: selectedIcon,
                    ),
                  );
                  selectedIcon = null;
                  Navigator.pop(context);
                }
              },
            ),
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                selectedIcon = null;
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
