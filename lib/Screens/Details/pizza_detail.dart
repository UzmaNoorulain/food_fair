import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// The detail screen that shows the pizza image centered. The same
/// Hero tag is used so that the image animates seamlessly.
class PizzaDetailScreen extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String price;
  final Color bgcolor;

  const PizzaDetailScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.bgcolor,
  });

  @override
  State<PizzaDetailScreen> createState() => _PizzaDetailScreenState();
}

class _PizzaDetailScreenState extends State<PizzaDetailScreen> {
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

  // void _showOrderPopup(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return StatefulBuilder(
  //         builder: (context, setState) {
  //           double totalPrice = quantity * pricePerItem;
  //           return AlertDialog(
  //             title: Center(
  //                 child: Text(
  //                   "Confirm Order",
  //                   style: GoogleFonts.inter(fontWeight: FontWeight.bold),
  //                 )),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   "Select Quantity",
  //                   style: GoogleFonts.inter(fontWeight: FontWeight.w500),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     IconButton(
  //                       icon: Icon(Icons.remove),
  //                       onPressed: quantity > 1
  //                           ? () {
  //                         setState(() {
  //                           quantity--;
  //                         });
  //                       }
  //                           : null,
  //                     ),
  //                     Text(quantity.toString(), style: TextStyle(fontSize: 18)),
  //                     IconButton(
  //                       icon: Icon(Icons.add),
  //                       onPressed: () {
  //                         setState(() {
  //                           quantity++;
  //                         });
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 10),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       "Total:",
  //                       style: GoogleFonts.inter(
  //                           fontWeight: FontWeight.bold, fontSize: 20),
  //                     ),
  //                     Text(
  //                       "\$${totalPrice.toStringAsFixed(2)}",
  //                       style: GoogleFonts.inter(
  //                           fontSize: 20,
  //                           fontWeight: FontWeight.bold,
  //                           color: Colors.black),
  //                     ),
  //                   ],
  //                 ),
  //                 // Text("Total Price: \$${totalPrice.toStringAsFixed(2)}",
  //                 //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //               ],
  //             ),
  //             actions: [
  //               TextButton(
  //                 style:
  //                 TextButton.styleFrom(foregroundColor: Colors.black),
  //                 onPressed: () {
  //                   Navigator.pop(context); // Close dialog
  //                 },
  //                 child: Text("Cancel"),
  //               ),
  //               ElevatedButton(
  //                 style: ElevatedButton.styleFrom(
  //                     foregroundColor: Colors.black,
  //                     backgroundColor:widget.bgcolor),
  //                 onPressed: () {
  //                   Navigator.pop(context); // Close dialog
  //                   _showSnackBar(context); // Show snackbar
  //                 },
  //                 child: Text("Confirm Order"),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
  void _showOrderPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double totalPrice = quantity * pricePerItem;
            return AlertDialog(
              backgroundColor: Colors.white, // Dialog background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Rounded corners
              ),
              elevation: 10, // Adds shadow to the dialog
              title: Center(
                child: Text(
                  "Confirm Order",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.blueGrey, // Title color
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Select Quantity",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
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
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Total:",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "\$${totalPrice.toStringAsFixed(2)}",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: widget.bgcolor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.bgcolor, // Button background color
                    foregroundColor: Colors.white, // Button text color
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded button
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    _showSnackBar(context); // Show snackbar
                  },
                  child: Text(
                    "Confirm Order",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
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
        backgroundColor: widget.bgcolor,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    // Use the same unique hero tag as in the PizzaCard.
    final String heroTag = 'pizza-${widget.name}';

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
        title: Text(
          widget.name,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: widget.bgcolor,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: widget.bgcolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200.0),
                      bottomRight: Radius.circular(200.0))),
            ),
            Positioned(
              top: -50,
              left: 50,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Hero(
                      tag: heroTag,
                      // Optionally, you can also define a flightShuttleBuilder here if needed.
                      child: Image.asset(
                        widget.imageUrl,
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 220,
              child: SizedBox(
                height: 500,
                width: 400,
                child: Center(
                  child: Text(
                    "Indulge in a glorious cascade of melted cheese draped elegantly over a perfectly baked crust 🍕, where every bite unfolds layers of rich, savory goodness 😋, inviting you on an unforgettable journey to a world of cheesy ecstasy 🧀✨.",
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
              bottom: 180,
              child: SizedBox(
                height: 50,
                width: 400,
                child: Center(
                  child: Text(
                    "\$${widget.price}",
                    style: GoogleFonts.inter(
                      color: widget.bgcolor,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 80,
                left: 80,
                child:
                SizedBox(
                  height: 60,
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      _showOrderPopup(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: widget.bgcolor ,
                      side: BorderSide(color: widget.bgcolor), // Border color same as text
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
                ),),
          ],
        ),
      ),
    );
  }
}
