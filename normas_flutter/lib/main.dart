import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pages/home/home.controller.dart';
import 'pages/home/home.page.dart';
import 'pages/login/login.page.dart';
import 'pages/register_standard/register_standard.page.dart';
import 'pages/signup/singup.page.dart';
import 'pages/splash/splash.page.dart';
import 'pages/users_list/users_list.page.dart';

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
    return MultiProvider(
      providers: [
        Provider<ScrollController>(
          create: (_) => ScrollController(),
        ),
        Provider<HomeController>(
          create: (_) => HomeController(),
        ),
      ],
      child: MaterialApp(
        title: 'Normas Flutter',
        routes: {
          "/Home": (context) => HomePage(),
          "/RegisterStandard": (context) => RegisterStandardPage(),
          "/UsersList": (context) => UsersListPage(),
          "/Login": (context) => LoginPage(),
          "/SignUp": (context) => SignUpPage(),
          "/Splash": (context) => SplashPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
      ),
    );
  }
}
