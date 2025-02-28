import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Screens/Details/burger_details.dart';
import '../gradient_widget.dart';

class BurgerCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String price;

  const BurgerCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  _BurgerCardState createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the details screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BurgerDetails(
              title: widget.title,
              imagePath: widget.imagePath,
              price: widget.price,
            ),
          ),
        );
      },
      child: Hero(
        // Use a unique tag; you can use widget.title or any unique identifier
        tag: widget.title,
        child: Card(
          child: Container(
            height: 250,
            width: 180,
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 40,
                  child: Image(
                    image: AssetImage(widget.imagePath),
                    width: 100,
                    height: 100,
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 15,
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      widget.title,
                      style: GoogleFonts.inter(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 15,
                  child: GradientWidget(
                    child: Text(
                      widget.price.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: IconButton(
                      onPressed: () {
                        // Add shopping bag functionality if needed
                      },
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 65,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // Toggle the like state
                          isLiked = !isLiked;
                        });
                      },
                      icon: Icon(
                        isLiked
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        color:
                        isLiked ? Colors.red : Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
