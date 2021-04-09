import 'package:flutter/material.dart';

class IndiceUvBottomCard extends StatelessWidget {
  final BoxConstraints constraints;
  final int indiceUv;

  const IndiceUvBottomCard({Key key, this.constraints, this.indiceUv})
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
              "Índice Uv",
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
               Container(

                 child:Text("UV", style: TextStyle(color: Colors.white),)
               ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.04,
                ),
                Text(
                  verificaIndiceUv(indiceUv),
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

  String verificaIndiceUv(int indiceUv) {
    if (indiceUv <= 2) {
      return "Baixo";
    } else if (indiceUv > 2 && indiceUv <= 5) {
      return "Moderado";
    } else if (indiceUv > 5 && indiceUv <= 7) {
      return "Alto";
    } else if (indiceUv > 7 && indiceUv <= 10) {
      return "Muito Alto";
    } else {
      return "Extremo";
    }
  }
}
