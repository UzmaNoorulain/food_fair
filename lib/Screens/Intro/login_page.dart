import 'package:flutter/material.dart';
import 'package:food_fair/Screens/Intro/page1.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 250,
              width: 250,
              child: Image.asset(
                "Assets/Images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            Text("Welcome Back",style: GoogleFonts.inter(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              width: 350,
                child: Text("Your next meal is just a tap away  let's satisfy your cravings!",style: GoogleFonts.inter(fontSize: 15,fontWeight: FontWeight.w500,),softWrap: true,textAlign: TextAlign.center,)),
            ElevatedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Page1Intro()));
            }, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
