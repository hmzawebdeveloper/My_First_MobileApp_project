import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_project/models/catogory_models.dart';
import 'package:my_project/models/diets_models.dart';
import 'package:my_project/models/popular_models.dart';
// import 'package:my_project/models/catogory_models.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<CategoryModels> categories = [];
  List<DietModels> diets = [];
  List<popularDietModels> popularDiets = [];

  void _getCategories() {
    categories = CategoryModels.getCategories();
  }

  // void _getDiets() {
  //   diets = DietModels.getDiets();
  // }

  // void _getPopularDiets() {
  //   popularDiets = popularDietModels.getPopularDiets();
  // }

  void _getInitialInfo() {
    categories = CategoryModels.getCategories();
    diets = DietModels.getDiets();
    popularDiets = popularDietModels.getPopularDiets();
  }

  @override
  void initState() {
    // TODO: implement initState
    _getCategories();
    // _getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    // initState();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: appBar(),
        body: ListView(
          children: [
            _textField(),
            SizedBox(height: 40),
            _categoriesSection(),
            SizedBox(height: 40),
            _dietSection(),
            SizedBox(height: 40),

            //============//
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ), //textstyle
                  ), // popoular heading text
                ), // padding
                SizedBox(height: 15),
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder:
                      (context, index) =>
                          SizedBox(height: 25), // separatorBuilder
                  padding: EdgeInsets.only(left: 20, right: 20), //padding
                  itemCount: popularDiets.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,

                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(20),
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                            popularDiets[index].iconPath,
                            height: 65,
                            width: 65,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  popularDiets[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  popularDiets[index].level +
                                      ' | ' +
                                      popularDiets[index].duration +
                                      ' | ' +
                                      popularDiets[index].calorie,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                      255,
                                      142,
                                      142,
                                      142,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }, //item builder
                ), //ListView
              ],
            ), //column
            SizedBox(height: 40),
            //COLUMMN
          ], //CHILDREN
        ),
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Recommendation \nfor Diets",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ), //TEXT
        ), //PADDING
        SizedBox(height: 15),
        Container(
          height: 240,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withAlpha(80),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(diets[index].iconPath),
                    Column(
                      children: [
                        Text(
                          diets[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          diets[index].level +
                              ' | ' +
                              diets[index].duration +
                              ' | ' +
                              diets[index].calorie,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 255, 0, 0),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print("view");
                      },
                      child: Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            "View",
                            style: TextStyle(
                              color:
                                  diets[index].viewIsSelected
                                      ? Colors.white
                                      : Color(0xffC58BF2),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected
                                  ? Color(0xff9DCEFF)
                                  : Colors.transparent,
                              diets[index].viewIsSelected
                                  ? Color(0xff92A3FD)
                                  : Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemCount: diets.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
          ),
        ),
      ], //CHILDREN
    );
  }

  Container _textField() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0xff1D1617).withAlpha(10),
            blurRadius: 40,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Category",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 120,
          // color: Colors.green,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20, right: 20),
            separatorBuilder: (context, index) => SizedBox(width: 25),
            itemBuilder: (context, index) {
              return Container(
                width: 90,
                decoration: BoxDecoration(
                  color: categories[index].boxColor.withAlpha(100),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SvgPicture.asset(categories[index].iconPath),
                      ),
                    ),
                    Text(
                      categories[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Break Fast",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      leading: GestureDetector(
        onTap: () {
          print("click me");
        },
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 240, 240, 240),
          ),
          child: Icon(Icons.add),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("click me");
          },
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: const Color.fromARGB(255, 240, 240, 240),
            ),
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
