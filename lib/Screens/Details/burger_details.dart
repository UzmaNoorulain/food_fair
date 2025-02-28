import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_fair/Widgets/gradient_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerDetails extends StatefulWidget {
  final String title;
  final String imagePath;
  final String price;

  // Add more fields if needed

  BurgerDetails({
    Key? key,
    required this.imagePath,
    required this.price,
    required this.title,
  }) : super(key: key);

  @override
  State<BurgerDetails> createState() => _BurgerDetailsState();
}

class _BurgerDetailsState extends State<BurgerDetails> {
  int quantity = 1;
  int _count = 1;
  double pricePerItem = 0.0; // Default value

  @override
  void initState() {
    super.initState();
    // Convert price from String to double
    pricePerItem = double.tryParse(widget.price.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  }
  void _showOrderPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double totalPrice = quantity * pricePerItem;
            return AlertDialog(
              title: Center(child: Text("Confirm Order",style: GoogleFonts.inter(fontWeight: FontWeight.bold),)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select Quantity",style: GoogleFonts.inter(fontWeight: FontWeight.w500),),
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
                  GradientWidget(
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Total:",style: GoogleFonts.inter(fontWeight: FontWeight.bold,fontSize: 20),),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // Text("Total Price: \$${totalPrice.toStringAsFixed(2)}",
                  //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(foregroundColor: Color(0xFFFB0F0F)),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(foregroundColor: Colors.white,backgroundColor: Color(0xFFFB0F0F)),
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
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text(title),
        // ),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Hero(
              tag: "null",
              child: Container(
                // color: Colors.grey,
                height: 800,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                // Shadow color
                                spreadRadius: 2,
                                // How much the shadow spreads
                                blurRadius: 15,
                                // Softness of the shadow
                                offset: Offset(4, 4), // X and Y offset
                              ),
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFFB0F0F), // Hex color for Blue
                                Color(0xffFF3D00), // Hex color for Purple
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                            ),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(100.0),
                                bottomLeft: Radius.circular(100.0))),
                      ),
                    ),
                    Positioned(
                      top: 180,
                      left: 50,
                      child: SizedBox(
                        height: 400,
                        width: 300,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(100.0),
                              topRight: Radius.circular(100.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 50,
                      child: Image.asset(
                        widget.imagePath,
                        width: 300,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                      bottom: 400,
                      left: 105,
                      child: Container(
                        height: 50,
                        width: 180,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFFB0F0F), // Hex color for Blue
                              Color(0xffFF3D00), // Hex color for Purple
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: _decrementCounter,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "$_count",
                              style: GoogleFonts.inter(
                                  color: Colors.white, fontSize: 20),
                            ),
                            IconButton(
                              onPressed: _incrementCounter,
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 330,
                      left: 70,
                      child: SizedBox(
                        height: 50,
                        width: 280,
                        child: Text(
                          widget.title,
                          style: GoogleFonts.inter(
                              fontSize: 24, fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          // Truncates text with "..."
                          maxLines: 2,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 270,
                      left: 140,
                      child: GradientWidget(
                        child: Text(
                          widget.price.toString(),
                          style: GoogleFonts.inter(
                              fontSize: 30,
                              fontWeight: FontWeight.w900,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 230,
                      right: 61,
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "⭐4.5",
                              style: GoogleFonts.inter(fontSize: 15),
                            ),
                            Text(
                              "🔥300cal",
                              style: GoogleFonts.inter(fontSize: 15),
                            ),
                            Text(
                              "⏱️5-10min",
                              style: GoogleFonts.inter(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      child: SizedBox(
                        height: 100,
                        width: 400,
                        child: Text(
                          "Here are more details about the burger. You can add a description, ingredients, ratings, reviews, etc.",
                          style: GoogleFonts.inter(
                              fontSize: 16, color: Colors.grey.shade800),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          maxLines: 4,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      bottom: 40,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            _showOrderPopup(context);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xffFF3D00) ,
                            side: BorderSide(color: Color(0xffFF3D00)), // Border color same as text
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart,color:  Colors.white),
                              Text("Add to Cart",style: GoogleFonts.inter(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              // Column(
              //   children: [
              //     Image.asset(
              //       imagePath,
              //       width: 300,
              //       height: 300,
              //     ),
              //     const SizedBox(height: 20),
              //     Text(
              //       title,
              //       style: GoogleFonts.inter(
              //         fontSize: 24,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const SizedBox(height: 10),
              //     GradientWidget(
              //       child: Text(
              //         price,
              //         style: GoogleFonts.inter(
              //             fontSize: 30,
              //             fontWeight: FontWeight.w900,
              //             color: Colors.white),
              //       ),
              //     ),
              //     const SizedBox(height: 20),
              //     // Add more detailed widgets here (like description, ingredients, etc.)
              //     Text(
              //       "Here are more details about the burger. You can add a description, ingredients, ratings, reviews, etc.",
              //       style: GoogleFonts.inter(fontSize: 16),
              //       textAlign: TextAlign.center,
              //     ),
              //   ],
              // ),
              ),
        ),
      ),
    );
  }
}
