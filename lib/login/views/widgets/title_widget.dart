import 'package:UrbanoWareCity_app/login/views/auth_card.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final AuthMode authMode;

  const TitleWidget({Key key, this.constraints, this.authMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: constraints.maxWidth * 0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  authMode == AuthMode.Login ? "Fazer Login" : "Registrar-se",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Container(
              height: constraints.maxHeight * 0.01,
              width: constraints.maxWidth * 0.2,
              color: Color.fromRGBO(74, 97, 108, 1),//Color.fromRGBO(18, 200, 180, 1),
            ),
          )
        ],
      ),
    );
  }
}
