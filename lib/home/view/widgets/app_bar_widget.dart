
import 'package:UrbanoWareCity_app/login/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AppBarWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final Function reloadPage;

  const AppBarWidget({Key key, this.constraints, this.reloadPage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = GetIt.I.get<AuthController>();
    return Container(
      height: constraints.maxHeight * 0.3,
      color: Color.fromRGBO(38, 50, 55, 1),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15, right: 10),
            child: Container(
              height: constraints.maxHeight * 0.1,
              color: Color.fromRGBO(38, 50, 55, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                    onPressed: reloadPage,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    onPressed: auth.logout,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: constraints.maxHeight * 0.15,
            width: constraints.maxWidth,
            color: Color.fromRGBO(38, 50, 55, 1),
            child: Padding(
              padding: EdgeInsets.only(
                left: constraints.maxWidth * 0.1,
              ),
              child: Text(
                "UrbanoWare",
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
