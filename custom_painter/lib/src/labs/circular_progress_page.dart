import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  double porcentaje = 0.0;
  double nuevoporcentaje = 0.0;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    controller.addListener(() {
      // print('valor controller ${controller.value}');
      setState(() {
        // LerpDouble es básicamente una forma de obtener un porcentaje
        // basado en la diferencia de del total y el valor actual.
        porcentaje = lerpDouble(porcentaje, nuevoporcentaje, controller.value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          porcentaje = nuevoporcentaje;
          nuevoporcentaje += 10;

          if (nuevoporcentaje > 100) {
            nuevoporcentaje = 0;
            porcentaje = 0;
          }

          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          //color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo completado
    final x = size.width;
    final y = size.height;

    final paintCirculo = new Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = new Offset(x / 2, y / 2);
    final radio = min(x / 2, y / 2);

    canvas.drawCircle(center, radio, paintCirculo);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;
    //Parte que se va llenando
    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      //Se puede usar para graficos de pastel
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(_MiRadialProgress oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_MiRadialProgress oldDelegate) => false;
}
