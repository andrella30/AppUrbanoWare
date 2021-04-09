import 'package:flutter/material.dart';

class TemperaturaCard extends StatelessWidget {
  final BoxConstraints constraints;
  final double temperatura;

  const TemperaturaCard({Key key, this.constraints, this.temperatura})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: constraints.maxHeight * .2,
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
          onPressed: () {},
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    height: constraints.maxHeight * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Temperatura',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.wb_sunny,
                              size: 50,
                              color: Colors.yellow[700],
                            ),
                          ),
                          Container(
                            child: Text(
                              temperatura != 0
                                  ? temperatura.toInt().toString() + "°"
                                  : " ",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
