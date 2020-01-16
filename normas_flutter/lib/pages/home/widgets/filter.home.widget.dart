import 'package:flutter/material.dart';

class FilterStandard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Filtrar",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              ClipOval(
                child: Material(
                  color: Colors.transparent, // button color
                  child: InkWell(
                    // inkwell color
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: 25,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: false,
            maintainSize: false,
            maintainAnimation: true,
            maintainState: true,
            child: Container(
              height: 80,
              color: Colors.black12,
            ),
          )
        ],
      ),
    );
  }
}
