import 'package:flutter/material.dart';
import 'package:prod_software_rutinator/pantallas/login_screen.dart';
import 'package:splashify/splashify.dart';
import 'package:prod_software_rutinator/data/userdatabase.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});
  final Userdatabase userdb = Userdatabase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splashify(
        title: "Rutinator",
        imagePath: "assets/Rutinatorlogo2.png",
        imageSize: 550,
        backgroundColor: const Color.fromARGB(255, 237, 28, 36),
        navigateDuration: 3,
        child: LoginScreen(userdb: userdb,),
      )
    );
  }
  
}