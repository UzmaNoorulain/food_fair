import 'package:flutter/material.dart';
import 'package:food_fair/Widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Card/juice_card.dart';
import '../Widgets/header_section.dart';
import '../Widgets/menu_title.dart';

class ColdDrinks extends StatefulWidget {
  ColdDrinks({super.key});

  @override
  State<ColdDrinks> createState() => _ColdDrinksState();
}

class _ColdDrinksState extends State<ColdDrinks> {
  List<RadialGradient> fruitGradients = [
    RadialGradient(colors: [ Color(0xffF6CDCD),Color(0xffEA4444),]),
    // RadialGradient(colors: [Color(0xffd4fc79), Color(0xff96e6a1)]),
    // Apple
    // RadialGradient(colors: [Color(0xff0ba360), Color(0xff3cba92)]),
    // Orange
    RadialGradient(colors: [Colors.teal.shade100, Colors.teal]),
    RadialGradient(colors: [Colors.yellow, Colors.amber]),
    // Banana
    RadialGradient(colors: [Colors.blue.shade300, Colors.blueAccent]),
    // Grapes
    RadialGradient(colors: [
      Color(0xffffb199),
      Color(0xffff0844),
    ]),
    // Watermelon
    RadialGradient(colors: [Colors.yellow, Colors.pinkAccent]),
    RadialGradient(colors: [Colors.indigo.shade100, Colors.indigoAccent]),
    RadialGradient(colors: [Colors.pink, Colors.deepOrangeAccent]),

    RadialGradient(colors: [Colors.yellow.shade100, Colors.yellowAccent]),
    // Pineapple

    // Strawberry
    RadialGradient(colors: [Colors.orangeAccent, Colors.yellow]),
    // Mango
    // Peach
    RadialGradient(colors: [Colors.indigo.shade100, Colors.indigoAccent]),
    // Coconut
  ];
  List<String> fruits = [
    "Apple",
    "Banana",
    "Blueberry",
    "Lemon",
    "Mango",
    "Orange",
    "Strawberry",
    "Pomegranet",
    "Papaya",
    "Pineapple",
    "Rasberry",
    "Peach",
    "Coconut"
  ];
  List<String> _images = [
    "Assets/Images/juice/apple.png",
    "Assets/Images/juice/banana.png",
    "Assets/Images/juice/blueberry.png",
    "Assets/Images/juice/lemon.png",
    "Assets/Images/juice/mango.png",
    "Assets/Images/juice/orange.png",
    "Assets/Images/juice/strawbwrry.png",
    "Assets/Images/juice/pomegranet.png",
    "Assets/Images/juice/papaya.png",
    "Assets/Images/juice/pineaplle.png",
    "Assets/Images/juice/rasberry.png",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(
            context, '/home'); // Navigate to MenuPage
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            HeaderSection(),
            SizedBox(
              height: 30,
            ),
            MenuTitle(
              drinksColor: Color(0xFFFB0F0F),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // Two cards per row
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  // Adjust the childAspectRatio as needed. Here 180/250 approximates the card width to height ratio.
                  childAspectRatio: 180 / 250,
                ),
                itemBuilder: (context, index) {
                  return JuiceCard(
                      fruitGradients: fruitGradients[index],
                      images: _images[index],
                      fruits: fruits[index], index: index,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
