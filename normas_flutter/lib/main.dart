import 'package:flutter/material.dart';
import 'package:normas_flutter/pages/login/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Normas Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SingInModalDialogWidget(),
    );
  }
}
