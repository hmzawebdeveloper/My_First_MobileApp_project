class popularDietModels {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  popularDietModels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });

  static List<popularDietModels> getPopularDiets() {
    List<popularDietModels> popularDiets = [];

    popularDiets.add(
      popularDietModels(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: "30mins",
        calorie: "230kcal",
        boxIsSelected: true,
      ),
    );

    popularDiets.add(
      popularDietModels(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Hard',
        duration: "20mins",
        calorie: "210kcal",
        boxIsSelected: true,
      ),
    );
    return popularDiets;
  }
}
