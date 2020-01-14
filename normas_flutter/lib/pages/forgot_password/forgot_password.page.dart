import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:normas_flutter/pages/forgot_password/forgot_password.controller.dart';

final _forgotController = ForgotPasswordController();

_textField({String labelText, onChanged, String Function() errorText}) {
  return TextFormField(
    onChanged: onChanged,
    keyboardType: TextInputType.emailAddress,
    enableInteractiveSelection: false,
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

forgotPassword(context) {
  showDialog(
    context: context,
    //Para não fechar a caixa de diálogo qdo clicar fora dela
    barrierDismissible: true,
    builder: (context) {
      //AlertDialog foi envolvido pelo WillPopScope para usar o "onWillPop"
      return WillPopScope(
        //Para não permitir que a caixa de diálogo feche qdo clicar em voltar no Aparelho
        onWillPop: () async => true,
        child: Dialog(
          child: Container(
            constraints: BoxConstraints(minWidth: 300, maxHeight: 280),
            width: 300.0,
            child: singInModalWidget(context),
          ),
        ),
      );
    },
  );
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
                  "Esqueci minha senha",
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
            Text(
              "Informe seu e-mail de cadastro para receber uma mensagem com instruções de como definir uma nova senha de acesso ao sistema",
              style: TextStyle(
                fontSize: 13.0,
                color: Color.fromRGBO(33, 33, 33, 0.6),
              ),
            ),
            Observer(
              builder: (_) {
                return _textField(
                  labelText: "E-mail",
                  onChanged: _forgotController.userForgotPassword.changeEmail,
                  errorText: _forgotController.validateEmail,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (_) {
                return SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text("ENVIAR"),
                    color: Color(0xFF006CD0),
                    textColor: Colors.white,
                    onPressed: _forgotController.forgotIsValid
                        ? () {
                            _forgotController.onClickForgotPassword();
                            Navigator.pop(context);
                          }
                        : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ],
  );
}
