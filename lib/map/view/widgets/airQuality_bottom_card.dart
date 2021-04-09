import 'package:flutter/material.dart';

class AirQualityBottomCard extends StatelessWidget {
  final BoxConstraints constraints;
  final int airQuality;

  const AirQualityBottomCard({Key key, this.constraints, this.airQuality})
      : super(key: key);

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
              "Qualidade do Ar",
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
                Icon(
                  Icons.wb_cloudy,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                 verificaQualidadeAr(airQuality),
                  style: TextStyle(
                    fontSize: 15,
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


  String verificaQualidadeAr(int airQuality){
    if (airQuality <= 200) {
      return "Bom";
    } else if (airQuality <= 300) {
      return "Moderado";
    } else {
      return "Ruim";
    }
  }
}
