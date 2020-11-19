import 'package:custom_painter/src/pages/pinterest_page.dart';
import 'package:flutter/material.dart';

//import 'package:custom_painter/src/pages/slideshow_page.dart';
//import 'package:custom_painter/src/labs/slideshow_page.dart';
//import 'package:custom_painter/src/pages/graficas_circulares_page.dart';
//import 'package:custom_painter/src/labs/circular_progress_page.dart';
//import 'package:custom_painter/src/retos/cuadradoanimado_page.dart';
//import 'package:custom_painter/src/pages/headers_pages.dart';
//import 'package:custom_painter/src/pages/animaciones_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: PinterestPage(),
    );
  }
}
