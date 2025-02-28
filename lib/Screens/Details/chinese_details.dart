import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/gradient_widget.dart';

class ChineseDetails extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;

  ChineseDetails(
      {super.key,
      required this.name,
      required this.price,
      required this.imageUrl});

  @override
  State<ChineseDetails> createState() => _ChineseDetailsState();
}

class _ChineseDetailsState extends State<ChineseDetails> {
  int quantity = 1;
  int _count = 1;
  double pricePerItem = 0.0; // Default value

  @override
  void initState() {
    super.initState();
    // Convert price from String to double
    pricePerItem =
        double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  }

  void _showOrderPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double totalPrice = quantity * pricePerItem;
            return AlertDialog(
              title: Center(
                  child: Text(
                "Confirm Order",
                style: GoogleFonts.inter(fontWeight: FontWeight.bold),
              )),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Select Quantity",
                    style: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: quantity > 1
                            ? () {
                                setState(() {
                                  quantity--;
                                });
                              }
                            : null,
                      ),
                      Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total:",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  // Text("Total Price: \$${totalPrice.toStringAsFixed(2)}",
                  //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              actions: [
                TextButton(
                  style:
                      TextButton.styleFrom(foregroundColor: Colors.black),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Color(0xffFFE044)),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    _showSnackBar(context); // Show snackbar
                  },
                  child: Text("Confirm Order"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Order Successful! 🎉"),
        duration: Duration(seconds: 3),
        backgroundColor: Color(0xFFFA1C1C),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_count > 1) _count--; // Prevent negative values
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFE044),
      appBar: AppBar(
        backgroundColor: Color(0xffFFE044),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Special Meal",
          style: GoogleFonts.inter(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                size: 30,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 400,
              width: 400,
              child: Image(
                image: AssetImage(widget.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text(
                  widget.name,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 35,
              width: double.infinity,
              child: Center(
                child: Text(
                  widget.price,
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Enjoy Chinese dish of stir-fried fish ad perfectly seasoned",
                  style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                  ),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 60,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  _showOrderPopup(context);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black ,
                  side: BorderSide(color: Colors.black), // Border color same as text
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart,color:  Colors.white,size: 25,),
                    SizedBox(width: 5,),
                    Text("Add to Cart",style: GoogleFonts.inter(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///? ChatGPT
class SkewedCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    double cornerRadius = 20.0; // For rounded edges
    path.moveTo(cornerRadius, 0); // Start from top-left with rounded corner
    path.lineTo(size.width - cornerRadius, 0); // Top-right
    path.quadraticBezierTo(size.width, 0, size.width, cornerRadius); // Curve

    path.lineTo(
        size.width - 20, size.height - cornerRadius); // Skewed bottom-right
    path.quadraticBezierTo(size.width - 20, size.height, size.width - 40,
        size.height); // Bottom-right corner curve

    path.lineTo(cornerRadius, size.height); // Bottom-left
    path.quadraticBezierTo(
        0, size.height, 0, size.height - cornerRadius); // Curve

    path.lineTo(0, cornerRadius); // Left edge
    path.quadraticBezierTo(0, 0, cornerRadius, 0); // Curve

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

///? v0
class CustomShapeWidget extends StatelessWidget {
  const CustomShapeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 450,
      child: CustomPaint(
        painter: CustomShapePainter(),
      ),
    );
  }
}

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFD700) // Bright yellow color
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top-left
    path.moveTo(0, size.height * 0.1); // Add some padding from top

    // Add top-left rounded corner
    path.quadraticBezierTo(0, 0, size.width * 0.1, 0);

    // Draw top line
    path.lineTo(size.width * 0.9, 0);

    // Add top-right rounded corner
    path.quadraticBezierTo(size.width, 0, size.width, size.height * 0.1);

    // Draw right slanted line
    path.lineTo(size.width * 0.85, size.height * 0.9);

    // Add bottom-right rounded corner
    path.quadraticBezierTo(
        size.width * 0.85, size.height, size.width * 0.75, size.height);

    // Draw bottom line
    path.lineTo(size.width * 0.1, size.height);

    // Add bottom-left rounded corner
    path.quadraticBezierTo(0, size.height, 0, size.height * 0.9);

    // Close the path
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter oldDelegate) => false;
}
