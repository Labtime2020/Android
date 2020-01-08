import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FooterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE4E4E4),
      alignment: Alignment.center,
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo/logo-small-white.png",
                height: 50,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                "assets/logo/logo-small.png",
                height: 50,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "CC BY 2.0 BR NORMAS LabTIME / UFG - MEC",
            style: TextStyle(
              fontSize: 13.0,
              color: Color.fromRGBO(33, 33, 33, 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
