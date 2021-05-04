import 'package:flutter/material.dart';
import 'package:marvel_ruta_n/configuration.dart' as cg;
import 'package:marvel_ruta_n/views/home_page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: cg.nombreApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: cg.primaryMoradoOscuro,
      ),
      home: HomePageView(),
    );
  }
}

