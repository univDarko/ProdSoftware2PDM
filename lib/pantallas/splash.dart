import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/pantallas/login_screen.dart';
import 'package:splashify/splashify.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashify(
        title: "Rutinator",
        imagePath: "assets/Rutinatorlogo2.png",
        imageSize: 550,
        backgroundColor: const Color.fromARGB(255, 237, 28, 36),
        navigateDuration: 3,
        child: const LoginScreen(),
      )
    );
  }
  
}