import 'package:UrbanoWareCity_app/login/controller/auth_controller.dart';
import 'package:UrbanoWareCity_app/login/utils/auth_exceptions.dart';
import 'package:UrbanoWareCity_app/login/views/widgets/button_widget.dart';
import 'package:UrbanoWareCity_app/login/views/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum AuthMode { SignUp, Login }

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  AuthMode _authMode = AuthMode.Login;
  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {'email': '', 'password': ''};

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Ocorreu um erro!"),
        content: Text(msg),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Fechar"),
          ),
        ],
      ),
    );
  }

  Future<void> _subimit() async {
    if (!_form.currentState.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState.save();

    final auth = GetIt.I.get<AuthController>();

    try {
      if (_authMode == AuthMode.Login) {
        await auth.login(_authData["email"], _authData["password"]);
      } else {
        await auth.signup(_authData["email"], _authData["password"]);
      }
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog("Ocorreu um error inesperado");
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          color: Colors.white,
          child: Column(
            children: [
              Container(height: constraints.maxHeight * 0.15),
              TitleWidget(constraints: constraints, authMode: _authMode),
              Expanded(
                child: Form(
                  key: _form,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.grey,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            height: constraints.maxHeight * 0.1,
                            color: Colors.white12,
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  prefixIcon: Icon(Icons.email)),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => _validadeEmail(value),
                              onSaved: (value) => _authData['email'] = value,
                            ),
                          ),
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          primaryColor: Colors.grey,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                            height: constraints.maxHeight * 0.1,
                            color: Colors.white,
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              controller: _passwordController,
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  prefixIcon: Icon(Icons.lock)),
                              obscureText: true,
                              validator: (value) => _validadePassword(value),
                              onSaved: (value) => _authData['password'] = value,
                            ),
                          ),
                        ),
                      ),
                      if (_authMode == AuthMode.SignUp)
                        Theme(
                          data: Theme.of(context).copyWith(
                            primaryColor: Colors.grey,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Container(
                              height: constraints.maxHeight * 0.1,
                              color: Colors.white,
                              child: TextFormField(
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  labelText: 'Confirmar Senha',
                                  prefixIcon: Icon(Icons.lock),
                                ),
                                obscureText: true,
                                validator: _authMode == AuthMode.SignUp
                                    ? (value) {
                                        if (value != _passwordController.text) {
                                          return 'Senhas são diferentes';
                                        }
                                        return null;
                                      }
                                    : null,
                                //    onSaved: (value) => _authData['password'] = value,
                              ),
                            ),
                          ),
                        ),
                      if (_isLoading)
                        Center(child: CircularProgressIndicator())
                      else
                        ButtonWidget(
                          constraints: constraints,
                          authMode: _authMode,
                          submit: _subimit,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Column(
                          children: [
                            Text(
                                _authMode == AuthMode.Login
                                    ? "Não possui uma conta?"
                                    : "Já possui conta?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: constraints.maxHeight * 0.01,
                            ),
                            InkWell(
                              child: Text(
                                _authMode == AuthMode.Login
                                    ? 'Registre-se aqui'
                                    : 'Faça o Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(38, 150, 155, 1),//Color.fromRGBO(18, 200, 180, 1),
                                ),
                              ),
                              onTap: _switchAuthMode,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

_validadeEmail(value) {
  if (value.isEmpty || !value.contains("@")) {
    return 'Informe um e-mail válido';
  }

  return null;
}

_validadePassword(value) {
  if (value.isEmpty || value.length < 5) {
    return 'Informe uma senha válida';
  }

  return null;
}

