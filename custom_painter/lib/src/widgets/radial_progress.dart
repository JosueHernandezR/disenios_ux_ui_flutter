import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorArco;
  final double grosorFondo;
  final border;

  const RadialProgress({
    //Establecemos que es obligatorio
    @required this.porcentaje,
    //Definimos un color por defecto
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorArco = 10.0,
    this.grosorFondo = 5.0,
    this.border = StrokeCap.butt,
  });
  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Se dispara cada vez que el valor cambia.
    //Se llama el controller

    controller.forward(from: 0.0);
    //Diferencia a animar: valor anterior -valor actual
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget child) {
          return Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _MiRadialProgress(
                    (widget.porcentaje - diferenciaAnimar) +
                        (diferenciaAnimar * controller.value),
                    widget.colorPrimario,
                    widget.colorSecundario,
                    widget.grosorArco,
                    widget.grosorFondo,
                    widget.border),
              ));
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorArco;
  final double grosorFondo;
  final border;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario,
      this.grosorArco, this.grosorFondo, this.border);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromCircle(
      center: Offset(0, 0),
      radius: 180,
    );

    //Agregando gradiente al arco
    final Gradient gradiente = new LinearGradient(colors: <Color>[
      Color(0xffC1012FF),
      Color(0xff6D05E8),
      Colors.red,
    ]);

    //Circulo completado
    final x = size.width;
    final y = size.height;

    final paintCirculo = new Paint()
      ..strokeWidth = grosorFondo
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final center = new Offset(x / 2, y / 2);
    final radio = min(x / 2, y / 2);

    canvas.drawCircle(center, radio, paintCirculo);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorArco
      ..color = colorPrimario
      ..shader = gradiente.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = border;
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
