import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:normas_flutter/pages/register_standard/register_standard.controller.dart';
import 'package:normas_flutter/widgets/drawer.widget.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';

class RegisterStandardPage extends StatefulWidget {
  @override
  _RegisterStandardPageState createState() => _RegisterStandardPageState();
}

class _RegisterStandardPageState extends State<RegisterStandardPage> {
  final registerStandardController = RegisterStandardController();

  _textField({String labelText, onChanged, String Function() errorText}) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        counterText: labelText == "Descrição" ? "100/1000" : null,
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
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Image.asset(
            "assets/logo/logo-small-white.png",
            fit: BoxFit.cover,
          ),
        ),
        backgroundColor: Color(0xFF006CD0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerWidget(context),
      body: registerStandardWidgetPage(context),
    );
  }

  Widget registerStandardFormWidget(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                labelText: "Nome da norma",
                onChanged: registerStandardController
                    .userRegisterStandard.changeNameStandard,
                errorText: registerStandardController.validateNameStandard,
              );
            },
          ),
          Observer(
            builder: (_) {
              return _textField(
                labelText: "Descrição",
                onChanged: registerStandardController
                    .userRegisterStandard.changeDescriptionStandard,
                errorText:
                    registerStandardController.validateDescriptionStandard,
              );
            },
          ),
          Observer(
            builder: (_) {
              return _textField(
                labelText: "URL",
                onChanged: registerStandardController
                    .userRegisterStandard.changeUrlImageStandard,
                errorText: registerStandardController.validateUrlImageStandard,
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return RaisedButton(
                      onPressed: registerStandardController.getFile,
                      textColor: Colors.white,
                      color: Color(0xFF006CD0),
                      child: Text("ARQUIVO"),
                    );
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                Observer(
                  builder: (_) {
                    return Flexible(
                      child: Text(
                        registerStandardController
                                    .userRegisterStandard.fileStandard ==
                                null
                            ? "Tamanho máximo 100MB"
                            : registerStandardController
                                .userRegisterStandard.fileStandard
                                .toString()
                                .substring(
                                    registerStandardController
                                            .userRegisterStandard.fileStandard
                                            .toString()
                                            .lastIndexOf("/") +
                                        1,
                                    registerStandardController
                                        .userRegisterStandard.fileStandard
                                        .toString()
                                        .length),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Color.fromRGBO(33, 33, 33, 0.6),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Categorias",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                color: Color.fromRGBO(33, 33, 33, 0.6),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Observer(
                builder: (_) {
                  return RaisedButton(
                    onPressed:
                        registerStandardController.registerStandardIsValid
                            ? () {
                                //Navigator.pop(context);
                                registerStandardController
                                    .onClickRegisterStandard(context);
                              }
                            : null,
                    textColor: Colors.white,
                    color: Color(0xFF006CD0),
                    child: Text("CADASTRAR"),
                  );
                },
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                onPressed: () {},
                textColor: Colors.black,
                color: Color(0xFFE4E4E4),
                child: Text("CANCELAR"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget registerStandardWidgetPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Cadastrar"),
        backgroundColor: Color(0xFF006CD0),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  "Cadastrar Norma",
                  style: TextStyle(
                    color: Color(0xFF006CD0),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "Os campos com asteristico (*)\nsão preenchimento obrigatórios",
                //   style: TextStyle(
                //     fontSize: 13.0,
                //     color: Color.fromRGBO(33, 33, 33, 0.6),
                //   ),
                // ),
                registerStandardFormWidget(context),
              ],
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }
}
