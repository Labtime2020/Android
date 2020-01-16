import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home.controller.dart';

class CardItemStandard extends StatelessWidget {
  final String _title;
  final String _description;
  final int _numberViews;
  final int _index;
  final List<String> _tags;

  CardItemStandard(this._title, this._description, this._numberViews,
      this._tags, this._index);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    return _controller.searchController.text == null ||
            _controller.searchController.text == ""
        ? Container(
            height: 20,
            color: Colors.black,
          )
        : Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        _title,
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              _numberViews.toString(),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.visibility,
                              size: 20,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: double.infinity,
                  child: Text(
                    "Tags: ${_tags.toString()}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: double.infinity,
                  child: Text(
                    _description,
                    maxLines: 5,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black54,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 20.0, right: 12.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () => Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Tap on " + ' - ' + _index.toString()),
                            duration: Duration(milliseconds: 5),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 85,
                          child: Text(
                            "VISUALIZAR",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            ClipOval(
                              child: Material(
                                child: InkWell(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 25,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            ClipOval(
                              child: Material(
                                child: InkWell(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      Icons.file_download,
                                      size: 25,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
