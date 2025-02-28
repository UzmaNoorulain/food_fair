import 'package:flutter/material.dart';
import 'package:food_fair/Screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Page1Intro extends StatefulWidget {
  const Page1Intro({super.key});

  @override
  State<Page1Intro> createState() => _Page1IntroState();
}

class _Page1IntroState extends State<Page1Intro> {
  PageController _pageController = PageController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: PageView(
                  controller: _pageController,
                  children: [
                    introPage(
                      desc1: 'Order from your favourite',
                      image: "Assets/Images/intro1.jpg",
                      desc2: "stores and vendors",
                    ),
                    introPage(
                      desc1: 'Choose from a wide range of',
                      image: "Assets/Images/intro2.png",
                      desc2: "delicious meals",
                    ),
                    introPage(
                      desc1: 'Enjoy instant delivery',
                      image: "Assets/Images/intro3.jpg",
                      desc2: "and payment",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: SlideEffect( // Keeps all dots the same size
                    dotHeight: 10,
                    dotWidth: 10,
                    dotColor: Colors.grey, // Inactive dot color
                    activeDotColor: Colors.black, // Active dot color
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: AnimatedSmoothIndicator(
              //     // controller: _pageController, // PageController
              //     count:3, // Number of pages
              //     effect: WormEffect( // Animated effect
              //       dotHeight: 10,
              //       dotWidth: 10,
              //       dotColor: Colors.grey, // Inactive dot color
              //       activeDotColor: Colors.black, // Active dot color
              //       spacing: 8, // Space between dots
              //     ),
              //     activeIndex: activeIndex,
              //   ),
              // ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color:  Color(0xFFFB0F0F),),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(height: 150,)
            ],
          ),
        ),
      ),
    );
  }
}

class introPage extends StatelessWidget {
  final String desc1, desc2;
  final String image;

  // final PageController pageController;

  const introPage({
    super.key,
    required this.desc1,
    required this.image,
    required this.desc2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Text(
            desc1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            desc2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 200,
            width: 300,
            child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox(
          //   height: 100,
          // ),

        ],
      ),
    );
  }
}
///? Animated Indicator
// Widget buildIndicator() {
//   return AnimatedSmoothIndicator(
//     activeIndex: activeIndex,
//     count: 3,
//     effect: CustomizableEffect(
//       activeDotDecoration: DotDecoration(
//         dotBorder: DotBorder(width: 7, color: Colors.black),
//         width: 15,
//         // Outer circle size
//         height: 15,
//         color: Colors.transparent,
//         // Transparent background for the border
//         borderRadius: BorderRadius.circular(10),
//         // Border effect workaround: draw the dot with a background
//         // shape: BoxShape.circle,
//       ),
//       dotDecoration: DotDecoration(
//         width: 10, // Inactive dot size
//         height: 10,
//         color: Colors.black, // Inactive dot color
//         borderRadius: BorderRadius.circular(6),
//       ),
//       spacing: 10.0,
//       // Use activeColorOverride directly in logic
//     ),
//   );
// }
