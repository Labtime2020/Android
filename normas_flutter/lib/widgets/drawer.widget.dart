import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Color(0xFF006CD0),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text(
                    "Normas",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.account_circle),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Login"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/Login");
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.assignment_ind),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Cadastrar"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/SignUp");
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.library_books),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Normas"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/");
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.library_add),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Cadastrar norma"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/RegisterStandard");
            },
          ),
          ListTile(
            title: Row(
              children: <Widget>[
                Icon(Icons.list),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text("Listar usuários"),
                )
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/UsersList");
            },
          ),
        ],
      ),
    );
  }
}
