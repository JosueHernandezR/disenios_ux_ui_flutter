import 'package:flutter/material.dart';

import 'package:custom_painter/src/pages/headers_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: HeadersPage(),
    );
  }
}
