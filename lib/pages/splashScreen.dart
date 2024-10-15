import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Auth/LoginPage.dart';
import '../Auth/OTPscrren.dart';
import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
      //  color: Colors.red,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       image:
      //       //NetworkImage("https://about.fb.com/wp-content/uploads/2023/09/GettyImages-686732223.jpg"),
      //       //ExactAssetImage("assets/splash.webp"),
      //      // fit: BoxFit.cover,
      //     ),
      //   ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.asset(
             // "assets/nesSplash.jpg", // Ensure the path is correct
             //  fit: BoxFit.cover,
             //  width: width * 0.9,
             //  height: height * 0.5,
           // ),
            SizedBox(height: height * 0.1),
            const Text(
              "TAAZA KHABAR",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const SpinKitChasingDots(
              color: Colors.teal, // Change color if needed for visibility
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
