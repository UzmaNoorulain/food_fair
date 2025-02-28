import 'package:flutter/material.dart';
import 'package:food_fair/Screens/Details/chinese_details.dart';
import 'package:google_fonts/google_fonts.dart';

class ChineseCard extends StatelessWidget {
  final String name;
  final String price;
  final String imageUrl;

   ChineseCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChineseDetails(
              name: name,
              price: price,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        height: 500,
        width: 350,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFB0F0F), // Hex color for Blue
              Color(0xffFF6331), // Hex color for Purple
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              // Shadow color
              offset: Offset(4, 4),
              // Shadow position (horizontal, vertical)
              blurRadius: 10,
              // Blur radius
              spreadRadius: 0, // Optional: controls how much the shadow spreads
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 10,
              child: SizedBox(
                height: 40,
                width: 300,
                child: Center(
                  child: Text(
                    "Special Meal",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 60,
                left: 15,
                child: SizedBox(
                  height: 35,
                  width: 300,
                  child: Center(
                    child: Text(
                      name,
                      style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                )),
            Positioned(
              top: 80,
              left: 10,
              child: SizedBox(
                height: 300,
                width: 300,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
              left: 10,
              child: SizedBox(
                height: 40,
                width: 320,
                child: Center(
                  child: Text(
                    "\$${price}",
                    style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              left: 10,
              child: SizedBox(
                width: 300,
                height: 5,
                child: Text(
                  "Enjoy Chinese dish of stir-fried fish ad perfectly seasoned",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
