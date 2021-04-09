
import 'package:UrbanoWareCity_app/buracos/controller/buracos_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BuracosPage extends StatefulWidget {
  @override
  _BuracosPageState createState() => _BuracosPageState();
}

class _BuracosPageState extends State<BuracosPage> {
  final controller = GetIt.I.get<BuracoController>();

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _add(GoogleMapController ctr) {
    for (int i = 0; i < controller.latitudeBuracos.length; i++) {
      var markerIdVal = i.toString();
      final MarkerId markerId = MarkerId(markerIdVal);

      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
            controller.latitudeBuracos[i], controller.longitudeBuracos[i]),
        infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      );

      setState(() {
        print(markers);
        markers[markerId] = marker;
      });
    }
  }

  //List<Set<Marker>> markers = new List<Set<Marker>>();

  //void _onMapCreated(GoogleMapController ctr) {
    // mapController = ctr;

    // controller.latitudeBuracos.forEach((element) {
    //   int i = 0;
    //   final Marker marker = Marker(
    //     onTap: () {},
    //     markerId: new MarkerId("1"),
    //     position: LatLng(
    //         controller.latitudeBuracos[0], controller.longitudeBuracos[0]),
    //     infoWindow: InfoWindow(
    //       title: "Sensor01",
    //     ),
    //   );
    //   i++;

    //   setState(() {
    //     markers.add(marker);
    //     // markers.add(marker2);
    //     // markers.add(marker3);
    //   });
    // });

    // final Marker marker1 = Marker(
    //   onTap: () {},
    //   markerId: new MarkerId("1"),
    //   position:
    //       LatLng(controller.latitudeBuracos[0], controller.longitudeBuracos[0]),
    //   infoWindow: InfoWindow(
    //     title: "Sensor01",
    //   ),
    // );

    // final Marker marker2 = Marker(
    //   markerId: new MarkerId("2"),
    //   position:
    //       LatLng(controller.latitudeBuracos[1], controller.longitudeBuracos[1]),
    //   infoWindow: InfoWindow(
    //     title: "Sensor02",
    //   ),
    // );

    // final Marker marker3 = Marker(
    //   markerId: new MarkerId("3"),
    //   position:
    //       LatLng(controller.latitudeBuracos[2], controller.longitudeBuracos[2]),
    //   infoWindow: InfoWindow(
    //     title: "Sensor02",
    //   ),
    // );

    // setState(() {
    //   markers.add(marker1);
    //   // markers.add(marker2);
    //   // markers.add(marker3);
    // });
  //}

  @override
  Widget build(BuildContext context) {
    controller.fetchSensorBuracos();
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (context, snapshot) {
        return LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              AppBar(
                title: Text("Buracos"),
                backgroundColor: Color.fromRGBO(38, 50, 55, 1),
                actions: [
                  IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        controller.zeraSensors();
                        controller.fetchSensorBuracos();
                      })
                ],
              ),
               Observer(
                 builder: (_) {
                   return Container(
                     height: constraints.maxHeight -
                         MediaQuery.of(context).padding.top -
                         AppBar().preferredSize.height,
                     width: constraints.maxWidth,
                     child: GoogleMap(
                       onMapCreated: _add,
                       //onMapCreated: _onMapCreated,

                       initialCameraPosition: CameraPosition(
                         target: LatLng(-23.4273, -51.9375),
                         zoom: 13,
                       ),
                       //markers: markers,
                       markers: Set<Marker>.of(markers.values),
                       myLocationButtonEnabled: false,
                       mapToolbarEnabled: false,
                       zoomControlsEnabled: true,
                       //circles: controller.circles,
                       //polylines: controller.polylines,
                     ),
                   );
                 },
               ),
            ],
          );
        });
      },
    );
  }
}
