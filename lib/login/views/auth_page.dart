import 'package:UrbanoWareCity_app/login/views/auth_card.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
        body: Stack(
      children: [
        Center(child: AuthCard()),
      ],
    ));
  }
}