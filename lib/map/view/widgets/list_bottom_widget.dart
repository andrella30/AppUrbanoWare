import 'package:UrbanoWareCity_app/map/controller/sensor_user_controller.dart';
import 'package:UrbanoWareCity_app/map/view/widgets/airQuality_bottom_card.dart';
import 'package:UrbanoWareCity_app/map/view/widgets/humidity_bottom_card.dart';
import 'package:UrbanoWareCity_app/map/view/widgets/indiceUv_bottom_card.dart';
import 'package:UrbanoWareCity_app/map/view/widgets/temperature_bottom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ListBottomWidget extends StatefulWidget {
  final BoxConstraints constraints;

  const ListBottomWidget({Key key, this.constraints}) : super(key: key);

  @override
  _ListBottomWidgetState createState() => _ListBottomWidgetState();
}

class _ListBottomWidgetState extends State<ListBottomWidget> {
  final controller = GetIt.I.get<SensorUserController>();

  @override
  Widget build(BuildContext context) {
    controller.loadSensoruser();
    return Observer(
      builder: (_) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10, left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: widget.constraints.maxHeight * 0.13,
                  width: widget.constraints.maxWidth,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      TemperatureBottomCard(
                        constraints: widget.constraints,
                        temperatura: controller.temperatura,
                      ),
                      HumidityBottomCard(
                        constraints: widget.constraints,
                        umidade: controller.umidade,
                      ),
                      IndiceUvBottomCard(
                        constraints: widget.constraints,
                        indiceUv: controller.indiceUv,
                      ),
                      AirQualityBottomCard(
                        constraints: widget.constraints,
                        airQuality: controller.qualidadeAr,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: widget.constraints.maxHeight * 0.02,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget makeItem({title, icon, icon2, body, extra}) {
    return Container(
      width: widget.constraints.maxWidth * 0.35,
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black87,
      ),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                controller.temperatura > 20.0
                    ? Icon(
                        icon,
                        color: Colors.yellow,
                      )
                    : Icon(
                        icon2,
                        color: Colors.blue,
                      ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  body.toString() + extra,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
