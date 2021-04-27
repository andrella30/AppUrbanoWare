import 'package:UrbanoWareCity_app/map/controller/sensor_user_controller.dart';
import 'package:UrbanoWareCity_app/map/view/widgets/list_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final controller = GetIt.I.get<SensorUserController>();

  @override
  void initState() {
    controller.loadSensoruser();
    super.initState();
  }

  void _onMapCreated(GoogleMapController ctr) {
    mapController = ctr;
    final Marker marker = Marker(
      markerId: new MarkerId("1"),
      position: LatLng(
        double.parse(controller.latitude),
        double.parse(controller.longitude),
      ),
      infoWindow: InfoWindow(
        title: "Sensor01",
      ),
    );

    setState(() {
      markers.add(marker);
    });
  }

  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 50, 55, 1), //Colors.black87,
        title: Text("Meu Sensor"),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {
                LatLng position = LatLng(
                  double.parse(controller.latitude),
                  double.parse(controller.longitude),
                );
                mapController.moveCamera(CameraUpdate.newLatLng(position));
                print(position);
                final Marker marker = Marker(
                  markerId: new MarkerId("1"),
                  position: position,
                  infoWindow: InfoWindow(title: "Sensor 01"),
                );
                setState(() {
                  markers.add(marker);
                });
              },
            ),
          ),
        ],
      ),
      body: 
       controller.temperatura != null ?
      FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: <Widget>[
                  Observer(
                    builder: (_) {
                      return   Container(
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          onCameraMove: (data) {
                            print(data);
                          },
                          onTap: (position) {
                            print(position);
                          },
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                double.parse(controller.latitude),
                                double.parse(controller.longitude)),
                            zoom: 17,
                          ),
                          markers: markers,
                          myLocationButtonEnabled: false,
                          mapToolbarEnabled: false,
                          zoomControlsEnabled: false,
                          polylines: controller.polylines,
                        ),
                      ); 
                    },
                  ),
                  
                  ListBottomWidget(
                    constraints: constraints,
                  )
                  

                ],
              );
            },
          );
        },
      ) : Center(child: Text("Usuario sem sensor pessoal")),
    );
  }
}
