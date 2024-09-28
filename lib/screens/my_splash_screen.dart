import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:reciclaje_app/screens/home_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: false,
      duration: const Duration(milliseconds: 3500),
      nextScreen: const HomeScreen(),
      backgroundColor: Colors.white,
      splashScreenBody: Center(
        child: Lottie.asset(
          "assets/animations/lottie-robot.json",
          repeat: true,
        ),
      ),
    );
  }
}
