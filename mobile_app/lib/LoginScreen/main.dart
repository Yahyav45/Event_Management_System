import 'package:eventmanagement/LoginScreen/register.dart';
import 'package:eventmanagement/LoginScreen/splash.dart';
import 'package:flutter/material.dart';

import '../login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: {
      'register': (context) => MyRegister(),
      'login': (context) => MyLogin(),
      'splash': (context) => SplashScreen(),
    },
  ));
}


