import 'package:flutter/material.dart';
import 'package:listy/themes/app_colors.dart';

class AppTexts {
  static TextStyle logoText = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 50,
  );

  static TextStyle titlePage = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 25,
  );

  static TextStyle menuList = const TextStyle(
    color: AppColors.grayMediumColor,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static TextStyle baseText = const TextStyle(
    color: AppColors.grayDarkColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
}
