import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class PizzaCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final Color bgcolor;

  const PizzaCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    // Create a unique tag for the Hero widget using the pizza name.
    final String heroTag = 'pizza-$name';

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Top-left pizza image wrapped in a Hero widget.
            // Positioned(
            //   top: -75,
            //   left: -70,
            //   child: Hero(
            //     tag: heroTag,
            //     // flightShuttleBuilder customizes the transition.
            //     flightShuttleBuilder: (
            //         BuildContext flightContext,
            //         Animation<double> animation,
            //         HeroFlightDirection flightDirection,
            //         BuildContext fromHeroContext,
            //         BuildContext toHeroContext,
            //         ) {
            //       return RotationTransition(
            //         turns: animation,
            //         child: fromHeroContext.widget,
            //       );
            //     },
            //     child: Image.asset(
            //       imageUrl,
            //       width: 200,
            //       height: 200,
            //     ),
            //   ),
            // ),
            // Top-left pizza image wrapped in a Hero widget with custom flightShuttleBuilder.
            Positioned(
              top: -75,
              left: -70,
              child: Hero(
                tag: heroTag,
                flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                    ) {
                  // Use ReverseAnimation when popping the route
                  final Animation<double> rotationAnimation = flightDirection ==
                      HeroFlightDirection.pop
                      ? ReverseAnimation(animation)
                      : animation;

                  // Choose which widget to display based on the flight direction:
                  // For push, show the from widget; for pop, show the to widget.
                  final Widget transitioningWidget = flightDirection ==
                      HeroFlightDirection.pop
                      ? toHeroContext.widget
                      : fromHeroContext.widget;

                  return RotationTransition(
                    turns: rotationAnimation,
                    child: transitioningWidget,
                  );
                },
                child: Image.asset(
                  imageUrl,
                  width: 200,
                  height: 200,
                ),
              ),
            ),



            Positioned(
              bottom: -75,
              right: -70,
              child: Image.asset(
                imageUrl,
                width: 200,
                height: 200,
              ),
            ),
            // Pizza name at the top.
            Positioned(
              top: 30,
              child: SizedBox(
                height: 30,
                width: 400,
                child: Center(
                  child: Text(
                    name,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            // Description text.
            Positioned(
              left: 80,
              bottom: 70,
              child: SizedBox(
                height: 50,
                width: 250,
                child: Center(
                  child: Text(
                    "A cheesy, flavorful delight on a crispy crust! 🍕",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // Price text.
            Positioned(
              bottom: 40,
              child: SizedBox(
                height: 30,
                width: 400,
                child: Center(
                  child: Text(
                    "\$$price",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            // Bottom-right pizza image (static, not part of the hero).
          ],
        ),
      ),
    );
  }
}
