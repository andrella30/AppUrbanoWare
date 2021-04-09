import 'package:UrbanoWareCity_app/map/controller/sensor_user_controller.dart';
import 'package:UrbanoWareCity_app/map/view/map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCard extends StatefulWidget {
  final BoxConstraints constraints;
  final double latitude;
  final double longitude;

  const MapCard({Key key, this.constraints, this.latitude, this.longitude}) : super(key: key);

  @override
  _MapCardState createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  Set<Marker> markers = new Set<Marker>();
  final controller = GetIt.I.get<SensorUserController>();
  GoogleMapController mapController;

  @override
  void initState() {
    controller.loadSensoruser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _onMapCreated(GoogleMapController ctr) {
      setState(() {
        controller.loadSensoruser();
      });
      mapController = ctr;
      final Marker marker = Marker(
        markerId: new MarkerId("1"),
        position: LatLng(-23.417947, -51.943086),//LatLng(double.parse(controller.latitude), double.parse(controller.longitude)),
        
        infoWindow: InfoWindow(
          title: "Sensor01",
        ),
      );
      setState(() {
        markers.add(marker);
      });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: widget.constraints.maxHeight * 0.35, //0.55,
        width: widget.constraints.maxWidth * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: Observer(builder: (_) {
                return GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(-23.417947, -51.943086),
                    // target: LatLng(
                    //     controller.latitudeAtual, controller.longitudeAtual),

                    zoom: 16,
                  ),
                  markers: markers,
                  myLocationButtonEnabled: true,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                );
              }),
            ),
            Container(
              height: widget.constraints.maxHeight * 0.35,
              width: widget.constraints.maxWidth,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                color: Colors.transparent,
                 onPressed: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()),);
                 },
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: widget.constraints.maxHeight * 0.22),
                  child: Container(
                    height: widget.constraints.maxHeight * 0.1,
                    width: widget.constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "Localização",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
