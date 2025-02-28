import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JuiceDetails extends StatefulWidget {
  final String name;
  final RadialGradient gradient;
  final String images;
  final String price;

  JuiceDetails(
      {super.key,
      required this.name,
      required this.gradient,
      required this.images,
      required this.price});

  @override
  State<JuiceDetails> createState() => _JuiceDetailsState();
}

class _JuiceDetailsState extends State<JuiceDetails> {
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
        content: Text("Order Successful! 🎉",style: TextStyle(fontSize: 20),),
        duration: Duration(seconds: 3),
        backgroundColor: Color(0xFFFA1C1C),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: widget.gradient),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 30,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Positioned(
                    top: 200,
                    left: 40,
                    child: Container(
                      width: 300,
                      height: 400,
                      child: Hero(
                        tag: widget.name,
                        child: Center(
                            child: Image(
                          image: AssetImage(widget.images),
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -100,
                    left: 50,
                    child: Container(
                        width: 300,
                        height: 400,
                        child: Center(
                          child: Text(
                            "Explore",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                        )),
                  ),
                  Positioned(
                    top: -60,
                    left: 50,
                    child: Container(
                        width: 300,
                        height: 400,
                        child: Center(
                          child: Text(
                            "${widget.name} Juice",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: Container(
                        width: 350,
                        height: 400,
                        child: Center(
                          child: Text(
                            "🥤 Freshly blended ${widget.name} juice 🍊🍓—bursting with natural flavors, rich in nutrients, and perfect for a refreshing energy boost! ⚡💚",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.visible,
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 100,
                    left: 100,
                    child: SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shadowColor: Colors.black26,
                          textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                        ),
                        onPressed: () {_showOrderPopup(context);},
                        child: Text("\$${widget.price}"),
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
