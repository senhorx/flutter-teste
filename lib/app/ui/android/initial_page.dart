import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:teste_app/app/routes/app_routes.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SplashScreen(
            seconds: 3,
            gradientBackground: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.green[50],
                  Colors.green[200],
                  Colors.green[300],
                  Colors.green
                ]),
            navigateAfterSeconds: Routes.HOME,
            loaderColor: Colors.transparent,
          ),
          Container(
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo.png"), fit: BoxFit.contain)),
          )
        ],
      ),
    );
  }
}
