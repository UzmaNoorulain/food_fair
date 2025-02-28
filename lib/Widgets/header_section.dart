import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final Color allProducts;
  final Color forDelivery;

  const HeaderSection({
    super.key,
    this.allProducts = const Color(0xFFFB0F0F),
    this.forDelivery = const Color(0xFFFFFFFF),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 62,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFFB0F0F), width: 1),
            color: allProducts,
          ),
          child: Center(
            child: Text(
              "All Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: 62,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFFB0F0F), width: 1),
            color: forDelivery,
          ),
          child: Center(
            child: Text(
              "For Delivery",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
