import 'package:flutter/material.dart';
import 'package:listy/themes/app_colors.dart';

Future<IconData?> showIconPicker(
    {required BuildContext context, IconData? defaultIcon}) async {
  final List<IconData> allIcons = [
    Icons.favorite_rounded,
    Icons.circle,
    Icons.home,
    Icons.shopping_bag_rounded,
    Icons.card_giftcard_rounded,
    Icons.bakery_dining_rounded,
    Icons.local_pizza_rounded,
    Icons.egg_alt_rounded,
    Icons.liquor_rounded,
    Icons.local_cafe,
    Icons.restaurant_outlined,
    Icons.icecream_rounded,
    Icons.kitchen_outlined,
    Icons.pets_outlined,
    Icons.child_care_rounded,
    Icons.child_friendly_rounded,
    Icons.medical_services_rounded,
    Icons.chair_rounded,
    Icons.construction_outlined,
    Icons.cleaning_services_rounded,
    Icons.dry_cleaning_rounded,
    Icons.local_laundry_service_rounded,
    Icons.sanitizer_rounded,
    Icons.yard_rounded,
    Icons.eco_rounded,
    Icons.directions_car_rounded,
    Icons.pedal_bike_rounded,
    Icons.fitness_center_rounded,
    Icons.sports_baseball,
    Icons.menu_book_rounded,
    Icons.mouse_rounded,
    Icons.headphones,
    Icons.sports_esports_outlined,
    Icons.computer_rounded,
    Icons.smartphone_rounded,
  ];

  IconData? selectedIcon = defaultIcon;

  await showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text(
              'Selecione um ícone',
            ),
            content: Container(
              width: 300,
              height: 400,
              alignment: Alignment.center,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 60,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: allIcons.length,
                  itemBuilder: (_, index) => Container(
                        key: ValueKey(allIcons[index].codePoint),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: IconButton(
                            color: selectedIcon == allIcons[index]
                                ? AppColors.greenColor
                                : AppColors.grayMediumColor,
                            iconSize: 30,
                            icon: Icon(
                              allIcons[index],
                            ),
                            onPressed: () {
                              selectedIcon = allIcons[index];
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      )),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Fechar'))
            ],
          ));

  return selectedIcon;
}
