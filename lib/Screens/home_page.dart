import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_fair/Screens/Details/burger_details.dart';
import 'package:food_fair/Widgets/Card/burger_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/app_bar.dart';
import '../Widgets/gradient_widget.dart';
import '../Widgets/header_section.dart';
import '../Widgets/menu_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _images = [
    "Assets/Images/burger1.png",
    "Assets/Images/burger2.png",
    "Assets/Images/burger3.png",
    "Assets/Images/burger4.png",
    "Assets/Images/burger5.png",
    "Assets/Images/burger6.png",
  ];

  List<String> burgerNames = [
    "Bacon BBQ Burger",
    "Double Patty Melt",
    "Mushroom Swiss Burger",
    "Crispy Chicken Burger",
    "Veggie Delight Burger",
    "Hawaiian Pineapple Burger",
    "Ultimate Beef Burger",
    "Grilled Turkey Burger",
    "Buffalo Ranch Burger",
    "Cheddar Bacon Burger",
    "Teriyaki Glazed Burger",
    "Texas Heatwave Burger",
    "BBQ Pulled Pork Burger",
    "Garlic Butter Burger",
    "Avocado Ranch Burger",
    "Chipotle Black Bean Burger",
    "Philly Steak Burger",
  ];

  List<double> burgerPrices = [
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

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()
      async {
        Navigator.pushReplacementNamed(
            context, '/'); // Navigate to MenuPage
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              HeaderSection(),
              SizedBox(
                height: 30,
              ),
              MenuTitle(
                burgurColor: Color(0xFFFB0F0F),
              ),
              SizedBox(
                height: 30,
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
                    return BurgerCard(
                      title: burgerNames[index].toString(),
                      imagePath: _images[index].toString(),
                      // price: "\$${burgerPrices[index]}",
                      price: "\$${burgerPrices[index]}",
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
