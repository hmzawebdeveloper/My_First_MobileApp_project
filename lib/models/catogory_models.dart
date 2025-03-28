import 'package:flutter/material.dart';

class CategoryModels {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModels({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModels> getCategories() {
    List<CategoryModels> categories = [];

    categories.add(
      CategoryModels(
        name: 'salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Colors.red,
      ),
    );

    categories.add(
      CategoryModels(
        name: 'cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color.fromARGB(255, 54, 244, 54),
      ),
    );
    categories.add(
      CategoryModels(
        name: 'pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color.fromARGB(255, 54, 143, 244),
      ),
    );

    categories.add(
      CategoryModels(
        name: 'Smoothies',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color.fromARGB(255, 244, 54, 219),
      ),
    );

    return categories;
  }
}
