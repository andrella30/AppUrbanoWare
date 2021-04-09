import 'package:UrbanoWareCity_app/home/view/home_page.dart';
import 'package:UrbanoWareCity_app/login/controller/auth_controller.dart';
import 'package:UrbanoWareCity_app/login/views/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AuthOrHome extends StatefulWidget {
  @override
  _AuthOrHomeState createState() => _AuthOrHomeState();
}

class _AuthOrHomeState extends State<AuthOrHome> {
  final auth = GetIt.I.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return auth.isAuth ? HomePage() : AuthPage();
    });
  }
}