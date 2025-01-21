import 'package:flutter/material.dart';
import 'package:listy/themes/app_texts.dart';
import 'package:listy/themes/app_colors.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.pinkColor,
            ),
            child: Text(
              'listy',
              style: AppTexts.logoText,
            ),
          ),
          ListTile(
            title: Text(
              'Gerenciar produtos',
              style: AppTexts.menuList,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Gerenciar categorias',
              style: AppTexts.menuList,
            ),
            onTap: () {
              Navigator.pushNamed(context, '/categories');
            },
          ),
        ],
      ),
    );
  }
}
