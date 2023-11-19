import 'package:flutter/material.dart';
import 'package:firstapp/pages/home.dart';
import 'package:firstapp/pages/loading.dart';
import 'package:firstapp/pages/choose_location.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation()
    },
  ));
}
