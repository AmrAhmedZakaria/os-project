import 'package:Book_Shelf/homepage.dart';
import 'package:Book_Shelf/login.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(splash:
    Column(
      children: [
        Center(
          child: LottieBuilder.asset("assets/lottie/Animation - 1714274754198.json"


          ),
        )
        
      ],

    ), nextScreen:  Login(),
    splashIconSize: 400,

    backgroundColor: const Color.fromARGB(202, 169, 53, 53),);
  }
}
