import 'package:flutter/material.dart';
import 'package:custom_painter/src/pages/circular_progress_page.dart';

import 'package:custom_painter/src/retos/cuadradoanimado_page.dart';

//import 'package:custom_painter/src/pages/headers_pages.dart';
//import 'package:custom_painter/src/pages/animaciones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: CircularProgressPage(),
    );
  }
}
