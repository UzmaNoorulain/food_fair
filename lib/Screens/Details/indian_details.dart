import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/gradient_widget.dart';

class IndianDetails extends StatefulWidget {
  final String title;
  final String imagePath;
  final Color bgColor;

  IndianDetails(
      {super.key,
      required this.title,
      required this.imagePath,
      required this.bgColor});

  @override
  State<IndianDetails> createState() => _IndianDetailsState();
}

class _IndianDetailsState extends State<IndianDetails> {
  double pricePerItem = 5.99; // Bacon BBQ Burger

  bool isLiked = false;
  int quantity = 1;
  int _count = 1;

  // double pricePerItem =0.0; // Default value

  @override
  void initState() {
    super.initState();
    // Convert price from String to double
    // pricePerItem = double.tryParse(prices.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
  }

  void _showOrderPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return StatefulBuilder(
          builder: (
            context,
            setState,
          ) {
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
                              color: widget.bgColor),
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
                      TextButton.styleFrom(foregroundColor: widget.bgColor),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:widget.bgColor),
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
        backgroundColor: widget.bgColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            )),
        automaticallyImplyLeading: false,
        // title: Text(
        //   widget.title,
        //   style: GoogleFonts.inter(
        //     color: Colors.white,
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        backgroundColor: widget.bgColor,
        centerTitle: true,
      ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       left: 250,
      //       bottom: -90,
      //       child: Expanded(
      //         child: Transform.rotate(
      //           angle: 10,
      //           child: Container(
      //             height: 1500,
      //             width: 200,
      //             color: Colors.green,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       top: 80,
      //       child: SizedBox(
      //         height: 50,
      //         width: 200,
      //         child: Center(
      //           child: Text(
      //             widget.title,
      //             style: GoogleFonts.inter(
      //               color: Colors.black,
      //               fontSize: 30,
      //               fontWeight: FontWeight.bold,
      //             ),
      //             softWrap: true,
      //             overflow: TextOverflow.visible,
      //             textAlign: TextAlign.center,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       top: 250,
      //       left: 20,
      //       child: SizedBox(
      //         height: 300,
      //         width: 300,
      //         child: Center(
      //           child: Image(
      //             image: AssetImage(widget.imagePath),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [widget.bgColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center)),
        child: Column(
          children: [
            Hero(
              tag: 'indian',
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // image: DecorationImage(image: AssetImage("Assets/Images/muttonBiryani.png"),alignment: Alignment.centerRight),
                      //   color: widget.bgColor,
                      // borderRadius: BorderRadius.circular(15.0)
                      ),
                  child: Stack(
                    children: [
                      Positioned(
                        // top: -35,
                        right: -50,
                        bottom: -15,
                        child: SizedBox(
                          height: 350,
                          width: 350,
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage(widget.imagePath),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        left: 45,
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: Center(
                            child: Text(
                              widget.title,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 50,
                        left: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white30,
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
                      Positioned(
                        top: 20,
                        left: 100,
                        child: SizedBox(
                          height: 100,
                          width: 200,
                          child: Center(
                            child: Text(
                              pricePerItem.toString(),
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: -2,
                    top: -55,
                    child: SizedBox(
                      height: 400,
                      width: 400,
                      child: Center(
                        child: Text(
                          "🍛 Explore the rich flavors of Indian cuisine "
                          "with detailed dish descriptions, including ingredients, prepar"
                          "ation methods, and regional specialties. 🥘 From aromatic curr"
                          "ies to mouthwatering street food, discover the essence of "
                          "authentic Indian flavors! 🌶️🍽️",
                          style: GoogleFonts.inter(
                            color: Colors.grey.shade800,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 100,
                    bottom: 80,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          _showOrderPopup(context);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: widget.bgColor ,
                          side: BorderSide(color: widget.bgColor), // Border color same as text
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
            ),
          ],
        ),
      ),
    );
  }
}
