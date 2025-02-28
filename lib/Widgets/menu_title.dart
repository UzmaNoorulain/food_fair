// import 'package:flutter/material.dart';
//
// class MenuTitle extends StatelessWidget {
//   final Color burgurColor;
//   final Color chineseColor;
//   final Color pizzaColor;
//   final Color indianColor;
//   final Color drinksColor;
//
//   const MenuTitle({
//     super.key,
//     this.burgurColor=Colors.black,
//     this.chineseColor=Colors.black,
//     this.pizzaColor=Colors.black,
//     this.indianColor=Colors.black,
//     this.drinksColor=Colors.black,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             "Burger",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: burgurColor,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             "Chinese",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: chineseColor,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             "Pizza",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: pizzaColor,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             "Indian Dishes",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: indianColor,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Text(
//             "Cold Drinks",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//               color: drinksColor,
//             ),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food_fair/Screens/chinese.dart';
import 'package:food_fair/Screens/cold_drinks.dart';
import 'package:food_fair/Screens/home_page.dart';
import 'package:food_fair/Screens/pizza.dart';
import 'package:food_fair/Screens/indian_dishes.dart';

class MenuTitle extends StatelessWidget {
  final Color burgurColor;
  final Color chineseColor;
  final Color pizzaColor;
  final Color indianColor;
  final Color drinksColor;

  // final VoidCallback;

  const MenuTitle({
    super.key,
    this.burgurColor = Colors.black,
    this.chineseColor = Colors.black,
    this.pizzaColor = Colors.black,
    this.indianColor = Colors.black,
    this.drinksColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 10),
          _buildMenuItem(
            "Burger",
            burgurColor,
            () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          _buildMenuItem(
            "Chinese",
            chineseColor,
            () {

              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Chinese(),
              //     fullscreenDialog: true,
              //   ),
              // );
              Navigator.pushReplacementNamed(context, '/chinese');
            },
          ),
          _buildMenuItem(
            "Pizza",
            pizzaColor,
            () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Pizza(),
              //     fullscreenDialog: true,
              //   ),
              // );
              Navigator.pushReplacementNamed(context, '/pizza');

            },
          ),
          _buildMenuItem(
            "Indian Dishes",
            indianColor,
            () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => IndianDishes(),
              //     fullscreenDialog: true,
              //   ),
              // );
              Navigator.pushReplacementNamed(context, '/indian');

            },
          ),
          _buildMenuItem(
            "Juices",
            drinksColor,
            () {
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ColdDrinks(),
              //     fullscreenDialog: true,
              //   ),
              // );
              Navigator.pushReplacementNamed(context, '/drinks');

            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, Color color, VoidCallback? onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap, // If null, it will be non-clickable
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: color,
          ),
        ),
      ),
    );
  }
}
