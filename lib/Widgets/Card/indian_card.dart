import 'package:flutter/material.dart';
import 'package:food_fair/Screens/Details/indian_details.dart';
import 'package:google_fonts/google_fonts.dart';

class IndianCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final Color bgColor;

   IndianCard({
    super.key, required this.title, required this.imagePath, required this.bgColor,
  });

  @override
  State<IndianCard> createState() => _IndianCardState();
}

class _IndianCardState extends State<IndianCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'indian',
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IndianDetails(title: widget.title,bgColor: widget.bgColor,imagePath: widget.imagePath,),
            ),
          );
        },

        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              // image: DecorationImage(image: AssetImage("Assets/Images/muttonBiryani.png"),alignment: Alignment.centerRight),
                color: widget.bgColor,
                borderRadius: BorderRadius.circular(15.0)),
            child: Stack(
              children: [
                Positioned(
                  top: -35,
                  right: -30,
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.imagePath),
                    ),
                  ),
                ),
                Positioned(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: Center(
                      child: Text(
                        widget.title,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
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
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}