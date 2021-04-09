import 'package:UrbanoWareCity_app/buracos/view/buracos_page.dart';
import 'package:UrbanoWareCity_app/home/view/first_page.dart';
import 'package:UrbanoWareCity_app/sensor_map/controller/sensor_location_controller.dart';
import 'package:UrbanoWareCity_app/sensor_map/view/sensorLocation_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;

  final List<Widget> _telas = [
    FirstPage(),
    SensorLocationPage(),
    BuracosPage(),
  ];
  final controller = GetIt.I.get<SensorLocationController>();

  @override
  void initState() {
    controller.fetchSensorMonitor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _indiceAtual,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.online_prediction), label: "Monitoramento"),
          BottomNavigationBarItem(icon: Icon(Icons.circle), label: "Buracos"),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
