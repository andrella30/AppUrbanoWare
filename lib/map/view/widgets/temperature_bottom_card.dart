import 'package:flutter/material.dart';

class TemperatureBottomCard extends StatelessWidget {
  final BoxConstraints constraints;
  final double temperatura;

  const TemperatureBottomCard({Key key, this.constraints, this.temperatura}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: constraints.maxWidth * 0.35,
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
              "Temperatura",
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
                temperatura > 20.0
                    ? Icon(
                        Icons.wb_sunny,
                        color: Colors.yellow,
                      )
                    : Icon(
                        Icons.wb_cloudy,
                        color: Colors.blue,
                      ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  temperatura.toInt().toString() + "°",
                  style: TextStyle(
                    fontSize: 17,
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
