import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/drawer.widget.dart';
import 'package:normas_flutter/widgets/footer.widget.dart';

class SignUpPage extends StatelessWidget {
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
      body: SignUpWidgetPage(),
    );
  }
}

class SignUpWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: <Widget>[
                        Material(
                          elevation: 1.0,
                          shape: CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: Ink.image(
                            image:
                                AssetImage('assets/images/profile_image.jpg'),
                            fit: BoxFit.cover,
                            width: 120.0,
                            height: 120.0,
                            child: InkWell(
                              onTap: () {
                                changeImageProfileDialog(context);
                              },
                            ),
                          ),
                        ),
                        Text(
                          "Alterar Avatar",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromRGBO(33, 33, 33, 0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Informações do usuário",
                  style: TextStyle(
                    color: Color(0xFF006CD0),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Os campos com asteristico (*)\nsão preenchimento obrigatórios",
                  style: TextStyle(
                    fontSize: 13.0,
                    color: Color.fromRGBO(33, 33, 33, 0.6),
                  ),
                ),
                SignUpFormWidget(),
              ],
            ),
          ),
          FooterWidget(),
        ],
      ),
    );
  }

  void changeImageProfileDialog(BuildContext context) {
    Dialog dialogchangeImageProfile = Dialog(
      child: Container(
          height: 345.0,
          width: 300.0,
          child: changeImageProfileWidget(context)),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) => dialogchangeImageProfile);
  }

  Widget changeImageProfileWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Alterar Avatar",
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
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage:
                  ExactAssetImage('assets/images/profile_image.jpg'),
            ),
          ),
          RaisedButton(
            child: Text("ENVIAR IMAGEM"),
            color: Color(0xFF006CD0),
            textColor: Colors.white,
            onPressed: () {},
          ),
          Text(
            "Formatos de imagem: .bmp, jpg ou .png\ntamanho máximo 5MB",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF006CD0),
            ),
          )
        ],
      ),
    );
  }
}

class SignUpFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Nome*',
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.only(top: 10),
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Sobrenome*',
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.only(top: 10),
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'E-mail*',
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.only(top: 10),
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha*',
              labelStyle: TextStyle(
                fontSize: 18,
              ),
              contentPadding: EdgeInsets.only(top: 10),
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Letras e números, de 6 a 15 caracteres",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 13.0,
                color: Color.fromRGBO(33, 33, 33, 0.6),
              ),
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Confirmar Senha*',
              labelStyle: TextStyle(
                fontSize: 18,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            color: Color(0xFF006CD0),
            child: Text("CADASTRAR"),
          ),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.black,
            color: Color(0xFFE4E4E4),
            child: Text("CANCELAR"),
          ),
        ],
      ),
    );
  }
}
