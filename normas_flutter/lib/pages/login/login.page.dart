import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:normas_flutter/pages/login/login.controller.dart';
import 'package:normas_flutter/pages/signup/singup.page.dart';
import 'package:normas_flutter/utils/nav.dart';

class SingInModalDialogWidget extends StatefulWidget {
  @override
  _SingInModalDialogWidgetState createState() =>
      _SingInModalDialogWidgetState();
}

class _SingInModalDialogWidgetState extends State<SingInModalDialogWidget> {
  final controller = LoginController();

  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      obscureText: labelText == 'Senha' ? true : false,
      decoration: InputDecoration(
        errorText: errorText == null ? null : errorText(),
        contentPadding: EdgeInsets.only(top: 10),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 18,
        ),
      ),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Buildando a tela");
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                singInModalDialog(context);
              },
              child: Text("Show Login Dialog"),
            ),
          ],
        ),
      ),
    );
  }

  void singInModalDialog(BuildContext context) {
    Dialog dialogSingInModal = Dialog(
      child: Container(
        constraints: BoxConstraints(minWidth: 300, maxHeight: 350),
        width: 300.0,
        child: singInModalWidget(context),
      ),
    );

    showDialog(
        context: context, builder: (BuildContext context) => dialogSingInModal);
  }

  Widget singInModalWidget(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Acessar",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF616161),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    color: Color(0xFF616161),
                    icon: Icon(
                      Icons.close,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "E-mail",
                    onChanged: controller.user.changeEmail,
                    errorText: controller.validateEmail,
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
              Observer(
                builder: (_) {
                  return _textField(
                    labelText: "Senha",
                    onChanged: controller.user.changeSenha,
                    errorText: controller.validateSenha,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text("ENVIAR"),
                      color: Color(0xFF006CD0),
                      textColor: Colors.white,
                      onPressed: controller.isValid
                          ? () {
                              Navigator.pop(context);
                              controller.onClickLogin();
                            }
                          : null,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
                child: FlatButton(
                  child: Text("Esqueci Minha Senha"),
                  color: Colors.white,
                  textColor: Color(0xFF006CD0),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Ainda não é cadastrado?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      push(context, SignUpPage());
                    },
                    child: Text(
                      "CADASTRE-SE",
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF006CD0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
