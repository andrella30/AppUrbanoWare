import 'package:UrbanoWareCity_app/login/views/widgets/auth_or_home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
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
              colors: [ Color.fromRGBO(38, 50, 55, 1), Color.fromRGBO(38, 50, 55, 1)]
            ),
            navigateAfterSeconds: AuthOrHome(),
            loaderColor: Colors.transparent,
          ),
         // Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/logo.png"),
            //     fit: BoxFit.none,
            //   ),
            // ),
          //),
        ],
      ),
    );
  }
}