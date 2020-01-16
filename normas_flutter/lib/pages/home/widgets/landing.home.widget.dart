import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Life can feel overwhelming, but it doesn't have to. Todoist lets you keep track of everything in one place, so you can get it all done and enjoy more peace of mind along way",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
