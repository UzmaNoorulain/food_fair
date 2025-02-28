import 'package:flutter/material.dart';
import 'package:food_fair/Widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Card/indian_card.dart';
import '../Widgets/header_section.dart';
import '../Widgets/menu_title.dart';

class IndianDishes extends StatefulWidget {
   IndianDishes({super.key});

  @override
  State<IndianDishes> createState() => _IndianDishesState();
}

class _IndianDishesState extends State<IndianDishes> {
  final List<String> foodNames = [
    "Chicken Madras",
    "Mutton Biryani",
    "Chicken Tikka",

    "Idli & Vada",
    "Butter Chicken",
    "Italian Dosa",
    "Chicken & Nan",
    "Chole Bhature",
    " Chinese Dhokla",
    "Chicken Biryani",
    "Spring Roll Dosa",
    "Daal Makhni",
  ];
  final List<String> _images = [
    "Assets/Images/ChickenMadras.png",
    "Assets/Images/muttonBiryani.png",
    "Assets/Images/ChickenTikka.png",
    // "Assets/Images/indian2.png",

    "Assets/Images/idli.png",
    "Assets/Images/ButterChicken.png",
    "Assets/Images/Dosa.png",
    "Assets/Images/nan.png",
    "Assets/Images/chole.png",
    "Assets/Images/dokla1.png",
    "Assets/Images/chickenBiryani1.png",
    "Assets/Images/dosa1.png",
    "Assets/Images/daalMakhni.png",
  ];
  final List<Color> bgColor = [
    Color(0xFFFFC0CB), // Pastel Pink
    Color(0xffA3C9FF),   // Pastel Blue
    Color(0xffD4A7FF),   // Pastel Purple
    Color(0xff77D7A8),   // Pastel Green
    Color(0xffFBBF58), // Pastel Yellow
    Color(0xFFFECEAB), // Pastel Orange
    Color(0xffA8E6CF),   // Pastel Mint
    Color(0xFFFFDAB9), // Pastel Peach
    Color(0xffE0B0FF),   // Pastel Lavender
    Color(0xff80D0C5),   // Pastel Teal
    Color(0xFFFA8072), // Pastel Red
    Color(0xffD2B48C),   // Pastel Brown
  ];

  List<double> prices = [
    5.99, // Bacon BBQ Burger
    4.99, // Classic Cheeseburger
    6.49, // Double Patty Melt
    6.29, // Mushroom Swiss Burger
    5.49, // Crispy Chicken Burger
    4.99, // Veggie Delight Burger
    5.99, // Hawaiian Pineapple Burger
    7.49, // Ultimate Beef Burger
    5.89, // Grilled Turkey Burger
    6.79, // Buffalo Ranch Burger
    6.19, // Cheddar Bacon Burger
    6.99, // Teriyaki Glazed Burger
    5.99, // Texas Heatwave Burger
    7.29, // BBQ Pulled Pork Burger
    6.49, // Garlic Butter Burger
    6.79, // Avocado Ranch Burger
    5.99, // Chipotle Black Bean Burger
    7.99, // Philly Steak Burger
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
              indianColor: Color(0xFFFB0F0F),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (context,index){
                return IndianCard(title: foodNames[index], imagePath: _images[index], bgColor: bgColor[index],);
              }),
            ),
          ],
        ),
      ),
    );
  }
}


