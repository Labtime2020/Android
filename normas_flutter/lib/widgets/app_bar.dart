import 'package:flutter/material.dart';

import 'drawer.widget.dart';

class AppBarStandard extends StatelessWidget {
  final Widget appBody;

  const AppBarStandard({Key key, this.appBody}) : super(key: key);

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
        // backgroundColor: Color(0xFF006CD0),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: DrawerWidget(context),
      body: appBody,
    );
  }
}
