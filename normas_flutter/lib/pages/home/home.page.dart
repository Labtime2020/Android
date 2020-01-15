import 'package:flutter/material.dart';
import 'package:normas_flutter/widgets/drawer.widget.dart';

class HomePage extends StatelessWidget {
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
      body: ListView(
        children: <Widget>[
          landingPage(),
        ],
      ),
    );
  }
}

Widget landingPage() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            child: Image.asset(
              "assets/logo/logo-small.png",
              fit: BoxFit.cover,
            ),
          ),
          Text(
            "Lorem ipsum dolor sit amet",
            style: TextStyle(
              color: Color(0xFF006CD0),
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Life can feel overwhelming, but it doesn't have to. Todoist le",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}
