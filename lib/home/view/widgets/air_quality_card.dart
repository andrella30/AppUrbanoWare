import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AirQualityCard extends StatelessWidget {
  final BoxConstraints constraints;
  final double qualidadeAr;
  final double co;
  final double co2;
  final double nh4;
  final double tolueno;
  const AirQualityCard(
      {Key key,
      this.constraints,
      this.qualidadeAr,
      this.co,
      this.co2,
      this.nh4,
      this.tolueno})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: constraints.maxHeight * .22,
      width: constraints.maxWidth * .4,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 4,
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {
            showAlertDialog(context);
          },
          child: LayoutBuilder(builder: (_, constraints) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    children: [
                      Text(
                        "Qualidade do Ar",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: constraints.maxHeight * 0.1),
                  child: Center(
                    child: CircularPercentIndicator(
                      radius: constraints.maxHeight * 0.65,
                      lineWidth: 10.0,
                      percent:
                          verificaPercent(verificaQualidadeAr(qualidadeAr)),
                      reverse: true,
                      arcBackgroundColor: Colors.teal,
                      arcType: ArcType.HALF,
                      center: Padding(
                        padding:
                            EdgeInsets.only(top: constraints.maxHeight * 0.2),
                        child: Column(
                          children: [
                            Text(
                              qualidadeAr.toInt().toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            Text(
                              verificaQualidadeAr(qualidadeAr),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      circularStrokeCap: CircularStrokeCap.butt,
                      backgroundColor: Colors.transparent,
                      progressColor: Colors.grey,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  String verificaQualidadeAr(double airQuality) {
    if (airQuality <= 40) {
      return "Bom";
    } else if (airQuality > 41 && airQuality <= 80) {
      return "Moderado";
    } else if (airQuality > 81 && airQuality <= 120) {
      return "Ruim";
    } else if (airQuality > 121 && airQuality <= 200) {
      return "Muito Ruim";
    } else {
      return "Péssimo";
    }
  }

  double verificaPercent(String airQuality) {
    switch (airQuality) {
      case "Bom":
        return 1 - 0.20;
        break;
      case "Moderado":
        return 1 - 0.40;
        break;
      case "Ruim":
        return 1 - 0.60;
        break;
      case "Muito Ruim":
        return 1 - 0.80;
        break;
      case "Péssimo":
        return 1 - 0.99;
        break;
    }
  }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Qualidade do Ar"),
      content: Container(
        height: 150,
        child: Column(
          children: [
            _barQuality(context, "CO", co, 20),
            _barQuality(context, "CO2", co2, 100),
             _barQuality(context, "NH4", nh4, 5),
             _barQuality(context, "Tolueno", tolueno, 1),
          ],
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

Widget _barQuality(
    BuildContext context, String text, double valor, double limite) {
  return Container(
    child: Row(
      children: [
        Text("$text  ${valor.toStringAsFixed(2)}"), //MAX 20
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 15,
            width:  limite > 20 ? limite = 100 : limite - valor,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}
