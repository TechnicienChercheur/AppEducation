import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:projet_mois_de_mars/myhomepage/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 4500,
        // backgroundColor: Colors.yellow,
        splashIconSize: 1000,
        splash: Container(
          padding: const EdgeInsets.all(15.0),
          color: Colors.deepOrange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "BIENVENUE SUR ",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text("LeBosseur",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                "UNE APPLICATION DE QUIZ",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black38,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 50,
              ),
              Image(
                image: AssetImage("assets/images/quiz3.jpg"),
              ),
            ],
          ),
        ),
        nextScreen: const HomePage(),
        splashTransition: SplashTransition.scaleTransition);
  }
}
