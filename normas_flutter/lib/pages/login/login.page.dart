import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:normas_flutter/pages/forgot_password/forgot_password.page.dart';
import 'package:normas_flutter/pages/login/login.controller.dart';
import 'package:normas_flutter/pages/signup/singup.page.dart';
import 'package:normas_flutter/utils/nav.dart';
import 'package:normas_flutter/widgets/app_bar.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return AppBarStandard(
      appBody: loginPage(context),
    );
  }

  Widget loginPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Login"),
        backgroundColor: Color(0xFF006CD0),
      ),
      body: loginWidget(context),
    );
  }

  Widget loginWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
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
                      onChanged: controller.user.changePassword,
                      errorText: controller.validatePassword,
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
                    onPressed: () => forgotPassword(context),
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
          FooterWidget(),
        ],
      ),
    );
  }
}
