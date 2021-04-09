import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'sensor_location_controller.g.dart';

class SensorLocationController = _SensorLocationControllerBase
    with _$SensorLocationController;

abstract class _SensorLocationControllerBase with Store {
  @observable
  Set<Circle> circles = new Set<Circle>();

  @observable
  List<double> temperaturaSensor = [];

  @observable
  List<double> umidadeSensor = [];

  @observable
  List<int> indiceUvSensor = [];

  @observable
  List<double> qualidadeArSensor = [];

  @observable
  List<String> latitudeSensor = [];

  @observable
  List<String> longitudeSensor = [];

  @observable
  bool controlaMenu = false;

  @observable
  int indice = 1;

  @action
  fetchSensorMonitor() {
    final databaseReference = FirebaseDatabase.instance.reference();

    for (int i = 1; i < 4; i++) {
      databaseReference.child('sensor0$i').once().then((DataSnapshot snapshot) {
        temperaturaSensor.add(snapshot.value['temperatura']);
        umidadeSensor.add(snapshot.value['umidade']);
        indiceUvSensor.add(snapshot.value['indiceUv']);
        qualidadeArSensor.add(snapshot.value['qualidadeAr']);
        latitudeSensor.add(snapshot.value['latitude']);
        longitudeSensor.add(snapshot.value['longitude']);
      });
    }
    print(temperaturaSensor);
    print(latitudeSensor);
    print(longitudeSensor);
  }

  @action
  zeraSensors() {
    temperaturaSensor = [];
    latitudeSensor = [];
    longitudeSensor = [];
  }

  @action
  setCircle() {
    for (int i = 1; i < 4; i++) {
      circles.add(
        Circle(
          circleId: CircleId("$i"),
          center: LatLng(double.parse(latitudeSensor[i - 1]),
              double.parse(longitudeSensor[i - 1])),
          radius: 300,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(38, 50, 55, 1),
        ),
      );
    }
  }

  @action
  menuControlUp(int id) {
    controlaMenu = true;
    indice = id;
    print(controlaMenu);
    print(id);
  }

  @action
  menuControlDonw() {
    controlaMenu = false;
    print(controlaMenu);
  }
}
