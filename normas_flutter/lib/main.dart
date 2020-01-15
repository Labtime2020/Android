import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:normas_flutter/pages/register_standard/register_standard.page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Normas Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterStandardPage(),
    );
  }
}
