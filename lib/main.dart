import 'package:UrbanoWareCity_app/buracos/controller/buracos_controller.dart';
import 'package:UrbanoWareCity_app/home/controller/home_controller.dart';
import 'package:UrbanoWareCity_app/login/controller/auth_controller.dart';
import 'package:UrbanoWareCity_app/login/views/splash_page.dart';
import 'package:UrbanoWareCity_app/login/views/widgets/auth_or_home.dart';
import 'package:UrbanoWareCity_app/map/controller/sensor_user_controller.dart';
import 'package:UrbanoWareCity_app/sensor_map/controller/sensor_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<AuthController>(AuthController());
  getIt.registerSingleton<AuthOrHome>(AuthOrHome());
  getIt.registerSingleton<HomeController>(HomeController());
  getIt.registerSingleton<SensorUserController>(SensorUserController());
  getIt.registerSingleton<SensorLocationController>(SensorLocationController());
  getIt.registerSingleton<BuracoController>(BuracoController());
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
