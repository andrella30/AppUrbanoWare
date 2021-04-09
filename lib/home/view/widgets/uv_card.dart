import 'package:UrbanoWareCity_app/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class UvCard extends StatelessWidget {
  final BoxConstraints constraints;
  final int indiceUv;

  const UvCard({Key key, this.constraints, this.indiceUv}) : super(key: key);

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
          onPressed: () => showAlertDialog(context),
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
                          'Índice Uv',
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
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/uv_icon.PNG"),
                          ),
                          Observer(builder: (_) {
                            return Column(
                              children: [
                                Container(
                                  child: Text(
                                    indiceUv.toString(),
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    nivelUV(indiceUv),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })
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

  nivelUV(int indice) {
    if (indice < 2) {
      return "Baixo";
    } else if (indice >= 2 && indice <= 5) {
      return "Moderado";
    } else if (indice >= 6 && indice <= 7) {
      return "Alto";
    } else if (indice >= 8 && indice <= 10) {
      return "Muito Alto";
    } else if (indice == 11) {
      return "Extremo";
    } else {
      return "Erro";
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
      title: Text("Índice UV"),
      content: Container(
        width: 400,
        height: 400,
        child: Column(
          children: [
            cardIndice(context, " 0 - 1 ", "  Não é necessário proteção"),
            cardIndice(context, " 2 - 5 ", "  Filtro solar e óculos de sol"),
            cardIndice(context, " 6 - 7 ",
                "  Utilizar óculos, protetor\n  solar com filtro UV, chapéu"),
            cardIndice(context, " 8 - 10 ",
                " Filtro solar, óculos de sol.\n Evitar crianças ao sol."),
            cardIndice(context, "   11   ", "  Evitar exposição ao sol."),
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

Widget cardIndice(BuildContext context, String indice, String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 50,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
      child: Row(
        children: [
          Text(
            indice,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
