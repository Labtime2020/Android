import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:normas_flutter/pages/redefine_password/redefine_password.controller.dart';

final redefineController = RedefinePasswordController();

_textField({String labelText, onChanged, String Function() errorText}) {
  return TextFormField(
    onChanged: onChanged,
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
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

redefinePassword(context) {
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
            constraints: BoxConstraints(minWidth: 300, maxHeight: 300),
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
                  "Redefinir senha",
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
                  labelText: "Nova senha",
                  onChanged:
                      redefineController.userRedefinePassword.changePassword,
                  errorText: redefineController.validatePassword,
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            Observer(
              builder: (_) {
                return _textField(
                  labelText: "Confirmar nova senha",
                  onChanged: redefineController
                      .userRedefinePassword.changePasswordConfirm,
                  errorText: redefineController.validatePasswordConfirm,
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
                    child: Text("CONFIRMAR"),
                    color: Color(0xFF006CD0),
                    textColor: Colors.white,
                    onPressed: redefineController.signUpIsValid
                        ? () {
                            redefineController.onClickRedefinePassword();
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
