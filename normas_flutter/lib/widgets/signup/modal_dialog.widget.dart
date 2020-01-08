import 'package:flutter/material.dart';

class SignUpModalDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              changeImageProfileDialog(context);
            },
            child: Text("Show Custom Dialog With Image"),
          ),
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
