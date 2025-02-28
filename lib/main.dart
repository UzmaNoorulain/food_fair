import 'package:flutter/material.dart';
import 'package:food_fair/Screens/Intro/login_page.dart';
import 'package:food_fair/Screens/Intro/page1.dart';
import 'package:food_fair/Screens/chinese.dart';
import 'package:food_fair/Screens/cold_drinks.dart';
import 'package:food_fair/Screens/indian_dishes.dart';
import 'package:food_fair/Screens/pizza.dart';
import 'package:food_fair/Screens/splash_screen.dart';

import 'Screens/home_page.dart';

void main() {
  runApp( MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return _createRoute(LoginPage(), Offset(-1.0, 0.0));
          case '/intro':
            return _createRoute(Page1Intro(), Offset(-1.0, 0.0)); // Right to left
          case '/home':
            return _createRoute(HomePage(), Offset(-1.0, 0.0)); // Bottom to top
          case '/chinese':
            return _createRoute(Chinese(), Offset(-1.0, 0.0)); // Left to right
          case '/pizza':
            return _createRoute(Pizza(), Offset(-1.0, 0.0)); // Top to bottom
          case '/indian':
            return _createRoute(IndianDishes(), Offset(-1.0, 0.0)); // Diagonal
          case '/drinks':
            return _createRoute(ColdDrinks(), Offset(-1.0, 0.0)); // Opposite diagonal
          default:
            return null;
        }
      },
    );
  }

  // Function to create different slide animations based on the page
  PageRouteBuilder _createRoute(Widget page, Offset beginOffset) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: beginOffset, // Different animations based on page
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}



