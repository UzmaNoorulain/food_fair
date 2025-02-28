import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_fair/Widgets/app_bar.dart';
import 'package:food_fair/Widgets/header_section.dart';
import 'package:food_fair/Widgets/menu_title.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Card/chinese_card.dart';
import '../Widgets/gradient_widget.dart';

class Chinese extends StatefulWidget {
  const Chinese({super.key});

  @override
  State<Chinese> createState() => _ChineseState();
}

class _ChineseState extends State<Chinese> {

  List<Map<String, String>> chineseFoodList = [
    {
      "title": "Kung Pao Chicken",
      "image": "Assets/Images/chinese1.png",
      "price": "\$5.99"
    },
    {
      "title": "Sweet and Sour Pork",
      "image": "Assets/Images/chinese2.png",
      "price": "\$4.99"
    },
    {
      "title": "General Tso's Chicken",
      "image": "Assets/Images/chinese3.png",
      "price": "\$6.49"
    },
    {
      "title": "Peking Duck",
      "image": "Assets/Images/chinese4.png",
      "price": "\$6.29"
    },
    {
      "title": "Szechuan Beef",
      "image": "Assets/Images/chinese5.png",
      "price": "\$5.49"
    },
    {
      "title": "Hot and Sour Soup",
      "image": "Assets/Images/chinese1.png",
      "price": "\$4.99"
    },
    {
      "title": "Dumplings",
      "image": "Assets/Images/chinese2.png",
      "price": "\$5.99"
    },
    {
      "title": "Mapo Tofu",
      "image": "Assets/Images/chinese3.png",
      "price": "\$7.49"
    },
    {
      "title": "Chow Mein",
      "image": "Assets/Images/chinese4.png",
      "price": "\$5.89"
    },
    {
      "title": "Egg Fried Rice",
      "image": "Assets/Images/chinese5.png",
      "price": "\$6.79"
    },
    {
      "title": "Beef and Broccoli",
      "image": "Assets/Images/chinese3.png",
      "price": "\$6.19"
    },
    {
      "title": "Orange Chicken",
      "image": "Assets/Images/chinese4.png",
      "price": "\$6.99"
    },
    {
      "title": "Wonton Soup",
      "image": "Assets/Images/chinese1.png",
      "price": "\$5.99"
    },
    {
      "title": "Hunan Shrimp",
      "image": "Assets/Images/chinese2.png",
      "price": "\$7.29"
    },
    {
      "title": "Sesame Chicken",
      "image": "Assets/Images/chinese3.png",
      "price": "\$6.49"
    },
    {
      "title": "Lo Mein",
      "image": "Assets/Images/chinese4.png",
      "price": "\$6.79"
    },
    {
      "title": "Spring Rolls",
      "image": "Assets/Images/chinese1.png",
      "price": "\$5.99"
    },
    {
      "title": "Char Siu (Chinese BBQ Pork)",
      "image": "Assets/Images/chinese2.png",
      "price": "\$7.99"
    }
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
                chineseColor: Color(0xFFFB0F0F),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: CarouselSlider(items: chineseFoodList.map((food) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ChineseCard(name: food["title"]!, price: food['price']!, imageUrl: food['image']!);
                    },
                  );
                }).toList(),
                  options: CarouselOptions(
                  height: 500.0,
                  // Height of the carousel
                  enlargeCenterPage: true,
                  // Enlarges the center item
                  autoPlay: false,
                  // Enables automatic sliding
                  autoPlayInterval: Duration(seconds: 3),
                  // Time interval for auto-play
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  // Animation speed
                  enableInfiniteScroll: true,
                  // Enables infinite scrolling
                  viewportFraction: 0.8,
                  // Fraction of the viewport occupied by each item
                  scrollDirection: Axis
                      .horizontal, // Direction of the scroll (horizontal/vertical)
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

