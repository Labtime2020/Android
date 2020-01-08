import 'package:flutter/material.dart';
import 'package:normas_flutter/pages/singup.page.dart';
import 'package:normas_flutter/pages/users.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Normas Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UsersPage(),
    );
  }
}
