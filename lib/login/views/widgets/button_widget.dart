import 'package:UrbanoWareCity_app/login/views/auth_card.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final AuthMode authMode;
  final Function submit;

  const ButtonWidget({Key key, this.constraints, this.authMode, this.submit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: constraints.maxWidth * 0.25, right: constraints.maxWidth * 0.25),
      child: Container(
        child: RaisedButton(
          color: Color.fromRGBO(74, 97, 108, 1),//Color.fromRGBO(18, 200, 180, 1),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Center(
            child: Text(authMode == AuthMode.Login ? "ENTRAR" : "REGISTRAR", style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white
            ),),
          ),
          onPressed: submit,
        ),
      ),
    );
  }
}
