import 'dart:collection';

import 'package:UrbanoWareCity_app/map/model/sensor_user_model.dart';
import 'package:UrbanoWareCity_app/map/repositories/sensor_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
part 'sensor_user_controller.g.dart';

class SensorUserController = _SensorUserControllerBase
    with _$SensorUserController;

abstract class _SensorUserControllerBase with Store {
  SensorUserRepository sensorUserRepository;
  SensorUserModel sensorData;

  _SensorUserControllerBase() {
    sensorUserRepository = SensorUserRepository();
  }

  @observable
  String latitude = "";

  @observable
  String longitude = "";

  @observable
  double temperatura = 0;

  @observable
  double umidade = 0;

  @observable
  int qualidadeAr = 0;

  @observable
  int indiceUv = 0;

  @observable
  Set<Polyline> polylines = HashSet<Polyline>();

  @action
  loadSensoruser() async {
    SensorUserModel sensorData = await sensorUserRepository.fetchSensor();
    latitude = sensorData.latitudeAtual;
    longitude = sensorData.longitudeAtual;
    temperatura = sensorData.temperatura;
    umidade = sensorData.umidade;
    qualidadeAr = sensorData.qualidadeAr;
    indiceUv = sensorData.indiceUv;
    print(latitude);
  }

  @action
  setPolylines(String route) {
    List<LatLng> polylinesLatLongs = List<LatLng>();
    //polylinesLatLongs.add(LatLng(latitudeAtual, longitudeAtual));
    // polylinesLatLongs.add(LatLng(lat1, lgn1));
    // polylinesLatLongs.add(LatLng(lat2, lgn2));
    // polylinesLatLongs.add(LatLng(lat3, lgn3));
    // polylinesLatLongs.add(LatLng(lat4, lgn4));
    polylinesLatLongs.add(LatLng(-23.4283235, -51.94389189999998));
    polylinesLatLongs.add(LatLng(-23.4273234, -51.94389189999998));
    polylinesLatLongs.add(LatLng(-23.4263233, -51.94389189999998));

    polylines.add(Polyline(
      polylineId: PolylineId(route),
      points: polylinesLatLongs,
      color: Colors.black,
      width: 3,
    ));
  }
}
