import 'package:UrbanoWareCity_app/sensor_map/controller/sensor_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SensorLocationPage extends StatefulWidget {
  @override
  _SensorLocationPageState createState() => _SensorLocationPageState();
}

class _SensorLocationPageState extends State<SensorLocationPage> {
  final controller = GetIt.I.get<SensorLocationController>();
  Set<Circle> circles = new Set<Circle>();

  @override
  void initState() {
    controller.fetchSensorMonitor();
    //controller.setCircle();
    super.initState();
  }

  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();

  void _onMapCreated(GoogleMapController ctr) {
    mapController = ctr;
    final Marker marker1 = Marker(
      onTap: () {
        setState(() {
          controller.menuControlUp(1);
        });
      },
      markerId: new MarkerId("1"),
      position: LatLng(double.parse(controller.latitudeSensor[0]),
          double.parse(controller.longitudeSensor[0])),
      infoWindow: InfoWindow(
        title: "Sensor01",
      ),
    );

    final Marker marker2 = Marker(
      onTap: () {
        setState(() {
          controller.menuControlUp(2);
        });
      },
      markerId: new MarkerId("2"),
      position: LatLng(double.parse(controller.latitudeSensor[1]),
          double.parse(controller.longitudeSensor[1])),
      infoWindow: InfoWindow(
        title: "Sensor02",
      ),
    );

    final Marker marker3 = Marker(
      onTap: () {
        setState(() {
          controller.menuControlUp(3);
        });
      },
      markerId: new MarkerId("3"),
      position: LatLng(double.parse(controller.latitudeSensor[2]),
          double.parse(controller.longitudeSensor[2])),
      infoWindow: InfoWindow(
        title: "Sensor03",
      ),
    );

    setState(() {
      markers.add(marker1);
      markers.add(marker2);
      markers.add(marker3);
    });
  }

  setCircle() {
    for (int i = 1; i < 4; i++) {
      circles.add(
        Circle(
          circleId: CircleId("$i"),
          center: LatLng(double.parse(controller.latitudeSensor[i - 1]),
              double.parse(controller.longitudeSensor[i - 1])),
          radius: 300,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(38, 50, 55, 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.setCircle();
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                AppBar(
                  title: Text("Monitoramento"),
                  backgroundColor: Color.fromRGBO(38, 50, 55, 1),
                  actions: [
                    IconButton(
                        icon: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print(controller.latitudeSensor);
                          print(controller.longitudeSensor);
                          controller.zeraSensors();
                          controller.fetchSensorMonitor();
                          controller.menuControlDonw();
                          setCircle();
                        })
                  ],
                ),
                Stack(
                  children: [
                    Observer(
                      builder: (_) {
                        return Container(
                          height: constraints.maxHeight -
                              MediaQuery.of(context).padding.top -
                              AppBar().preferredSize.height,
                          width: constraints.maxWidth,
                          child: GoogleMap(
                           // 

                            initialCameraPosition: CameraPosition(
                              target: LatLng(-23.4273, -51.9375),
                              zoom: 13,
                            ),
                            markers: markers,
                            myLocationButtonEnabled: false,
                            mapToolbarEnabled: false,
                            zoomControlsEnabled: false,
                            circles: controller.circles,
                            //polylines: controller.polylines,
                            onMapCreated: _onMapCreated,
                          ),
                        );
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return controller.controlaMenu == true
                            ? card(
                                constraints: constraints,
                                indice: controller.indice)
                            : Container();
                      },
                    )
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget card({indice, constraints}) {
    return Positioned(
      top: constraints.maxHeight * 0.65,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          // bottomRight: Radius.circular(30),
          // bottomLeft: Radius.circular(30),
        ),
        child: Container(
          height: constraints.maxHeight * 0.25,
          width: constraints.maxWidth,
          color: Colors.white,
          child: Center(
              child: Column(
            children: [
              Container(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 185,
                      color: Colors.white,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wb_sunny),
                            SizedBox(width: 5),
                            Text("Temperatura "),
                            SizedBox(width: 5),
                            Text(controller.temperaturaSensor[indice - 1]
                                .toInt()
                                .toString()),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 185,
                      color: Colors.white,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Icon(Icons.wb_sunny),
                            SizedBox(width: 5),
                            Text("Qualidade do Ar "),
                            SizedBox(width: 5),
                            Text(controller.qualidadeArSensor[indice - 1]
                                .toInt()
                                .toString())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 185,
                      color: Colors.white,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Image.asset("assets/humidity_icon.png",
                                    width: 25, height: 25)),
                            SizedBox(width: 5),
                            Text("Umidade "),
                            SizedBox(width: 5),
                            Text(
                              controller.umidadeSensor[indice - 1]
                                  .toInt()
                                  .toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 185,
                      color: Colors.white,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Image.asset("assets/uv_icon.PNG",
                                    width: 25, height: 25)),
                            SizedBox(width: 5),
                            Text("Índice UV "),
                            SizedBox(width: 5),
                            Text(
                              controller.indiceUvSensor[indice - 1]
                                  .toInt()
                                  .toString(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //Text(indice.toString()),
            ],
          )),
        ),
      ),
    );
  }
}
