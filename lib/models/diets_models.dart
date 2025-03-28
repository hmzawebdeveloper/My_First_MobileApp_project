import 'dart:ui';

class DietModels {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected,
  });

  static List<DietModels> getDiets() {
    List<DietModels> diets = [];
    diets.add(
      DietModels(
        name: 'Honey Pancake',
        iconPath: 'assets/icons/honey-pancakes.svg',
        level: 'Easy',
        duration: '30mins',
        calorie: '180cal',
        boxColor: Color.fromARGB(255, 241, 92, 255),
        viewIsSelected: true,
      ),
    );
    diets.add(
      DietModels(
        name: 'Canai Bread',
        iconPath: 'assets/icons/canai-bread.svg',
        level: 'Easy',
        duration: '20mins',
        calorie: '230cal',
        boxColor: Color.fromARGB(255, 184, 242, 146),
        viewIsSelected: false,
      ),
    );
    return diets;
  }
}
