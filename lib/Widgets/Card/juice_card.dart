import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_fair/Screens/Details/juice_details.dart';
import 'package:google_fonts/google_fonts.dart';

class JuiceCard extends StatefulWidget {
  final RadialGradient fruitGradients;
  final String images;
  final String fruits;
  final int index;

  JuiceCard({
    super.key,
    required this.fruitGradients,
    required this.images,
    required this.fruits, required this.index,
  });

  @override
  State<JuiceCard> createState() => _JuiceCardState();
}

class _JuiceCardState extends State<JuiceCard> {
  List<String> _imagesJuice = [
    "Assets/Images/juice/appleJuice.png",
    "Assets/Images/juice/bananaJuice.png",
    "Assets/Images/juice/blueberryJuice.png",
    "Assets/Images/juice/lemonJuice.png",
    "Assets/Images/juice/mangoJuice.png",
    "Assets/Images/juice/orangeJuice.png",
    // "Assets/Images/juice/strawJuice.png",
    "Assets/Images/juice/strawberryJuice.png",
    "Assets/Images/juice/pomegranateJuice.png",
    "Assets/Images/juice/papayaJuice.png",
    "Assets/Images/juice/pineappleJuice.png",
    "Assets/Images/juice/rasberryJuice.png",
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
    // String juiceImage=_imagesJuice[widget.index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 800), // Adjust the speed
            reverseTransitionDuration: Duration(milliseconds: 800),
            pageBuilder: (context, animation, secondaryAnimation) => JuiceDetails(
              name: widget.fruits,
              gradient: widget.fruitGradients,
              images: _imagesJuice[widget.index], price: prices[widget.index].toString(), // Pass the correct image
            ),
          ),
        );
      },

      child: Stack(
        children: [
          Container(
            height: 300,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: widget.fruitGradients,
              // Circular Gradient
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Hero(
                tag: widget.fruits,
                child: Center(
                  child: Image(
                    image: AssetImage(widget.images.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 20,
            child: SizedBox(
              height: 100,
              width: 150,
              child: Center(
                child: Text(
                  "${widget.fruits} Juice",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
