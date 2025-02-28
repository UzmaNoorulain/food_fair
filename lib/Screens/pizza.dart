import 'package:flutter/material.dart';
import 'package:food_fair/Screens/Details/pizza_detail.dart';
import 'package:food_fair/Widgets/app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/Card/pizza_card.dart';
import '../Widgets/header_section.dart';
import '../Widgets/menu_title.dart';

class Pizza extends StatefulWidget {
  const Pizza({super.key});

  @override
  State<Pizza> createState() => _PizzaState();
}

class _PizzaState extends State<Pizza> {
  final List<String> _images = [
    "Assets/Images/pizza5.png",
    "Assets/Images/pizza6.png",
    "Assets/Images/pizza7.png",
    "Assets/Images/pizza8.png",
    "Assets/Images/pizza9.png",
    "Assets/Images/pizza10.png",
    "Assets/Images/pizza1.png",
    "Assets/Images/pizza2.png",
    "Assets/Images/pizza3.png",
    "Assets/Images/pizza4.png",
  ];
  final List<String> pizzaNames = [
    "Margherita",
    "Pepperoni",
    "BBQ Chicken",
    "Hawaiian",
    "Veggie Supreme",
    "Meat Lovers",
    "Buffalo Chicken",
    "Four Cheese",
    "Truffle Mushroom",
    "Pesto Chicken",
    "Tandoori Paneer",
    "Seafood Delight",
    "Spicy Jalapeno",
    "White Garlic",
    "Supreme Special",
  ];
  List<double> pizzaPrices = [
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
  final List<Color> bgcolor = [
    Color(0xffA79F0F),
    Color(0xffB52A04),
    Color(0xffFBBF58),
    Color(0xff47705B),
    Color(0xff0F2636),
    Color(0xff7EA92C),
    Color(0xffdba24a),
    Color(0xffFF6A00),
    Color(0xffFACD8E),
    Color(0xffBB6052),
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
              pizzaColor: Color(0xFFFB0F0F),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(seconds: 2), // Increased duration
                            reverseTransitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (context, animation, secondaryAnimation) => PizzaDetailScreen(
                              name: pizzaNames[index],
                              imageUrl: _images[index],
                              price: pizzaPrices[index].toString(),
                              bgcolor: bgcolor[index],
                            ),
                          ),
                        );
                      },
                      child: PizzaCard(
                        name: pizzaNames[index],
                        imageUrl: _images[index],
                        price: pizzaPrices[index].toString(),
                        bgcolor: bgcolor[index],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

// class PizzaCard extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final String price;
//   final Color bgcolor;
//
//   const PizzaCard({
//     super.key, required this.name, required this.imageUrl, required this.price, required this.bgcolor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         height: 180,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: bgcolor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               top: -75,
//               left: -70,
//               child: Image(
//                 image: AssetImage(imageUrl),
//                 width: 200,
//                 height: 200,
//               ),
//             ),
//             Positioned(
//               top: 30,
//               child: SizedBox(
//                 height: 30,
//                 width: 400,
//                 child: Center(
//                   child: Text(
//                     name,
//                     style: GoogleFonts.inter(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               left: 80,
//               bottom: 90,
//               child: SizedBox(
//                 height: 30,
//                 width: 250,
//                 child: Center(
//                   child: Text(
//                     "A cheesy, flavorful delight on a crispy crust! 🍕",
//                     style: GoogleFonts.inter(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500),
//                     textAlign: TextAlign.center,
//                     softWrap: true,
//                     overflow: TextOverflow.visible,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               // left: 5,
//               bottom: 40,
//               child: SizedBox(
//                 height: 30,
//                 width: 400,
//                 child: Center(
//                   child: Text(
//                     "\$${price}",
//                     style: GoogleFonts.inter(
//                         color: Colors.white,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w900),
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               bottom: -75,
//               right: -70,
//               child: Image(
//                 image: AssetImage(imageUrl),
//                 width: 200,
//                 height: 200,
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
/// with the top-left image wrapped in a Hero for the transition.
