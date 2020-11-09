import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedondeado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ));
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  // Painter
  void paint(Canvas canvas, Size size) {
    //lapiz
    final paint = Paint();
    double x = size.width;
    double y = size.height;
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke .fill
    // Que tan anchi puede ser el lapiz
    paint.strokeWidth = 2;

    //Posicion del lapiz
    final path = new Path();
    // Dibujar con el path y el lápiz
    path.moveTo(0, y * 0.35);
    path.lineTo(x, y * 0.30);
    path.lineTo(x, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, y * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderDiagonalPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderDiagonalPainter oldDelegate) => false;
}

class HeaderTriangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderTrianguloPainter(),
        ));
  }
}

class _HeaderTrianguloPainter extends CustomPainter {
  @override
  // Painter
  void paint(Canvas canvas, Size size) {
    //lapiz
    final paint = Paint();
    double x = size.width;
    double y = size.height;
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke .fill
    // Que tan anchi puede ser el lapiz
    paint.strokeWidth = 2;

    //Posicion del lapiz
    final path = new Path();
    // Dibujar con el path y el lápiz
    // path.moveTo(0, 0);
    path.lineTo(x, y);
    path.lineTo(x, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderTrianguloPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderTrianguloPainter oldDelegate) => false;
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderPicoPainter(),
        ));
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  // Painter
  void paint(Canvas canvas, Size size) {
    //lapiz
    final paint = Paint();
    double x = size.width;
    double y = size.height;
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke .fill
    // Que tan anchi puede ser el lapiz
    paint.strokeWidth = 2;

    //Posicion del lapiz
    final path = new Path();
    // Dibujar con el path y el lápiz
    // path.moveTo(0, 0);
    path.lineTo(0, y * 0.25);
    path.lineTo(x * 0.50, y * 0.30);
    path.lineTo(x, y * 0.25);
    path.lineTo(x, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderPicoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderPicoPainter oldDelegate) => false;
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),
        ));
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  // Painter
  void paint(Canvas canvas, Size size) {
    //lapiz
    final paint = Paint();
    double x = size.width;
    double y = size.height;
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke .fill
    // Que tan anchi puede ser el lapiz
    paint.strokeWidth = 2;

    //Posicion del lapiz
    final path = new Path();
    // Dibujar con el path y el lápiz
    // path.moveTo(0, 0);
    path.lineTo(0, y * 0.2);
    path.quadraticBezierTo(x * 0.5, y * 0.5, x, y * 0.20);
    path.lineTo(x, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderCurvoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderCurvoPainter oldDelegate) => false;
}

class HeaderWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWavePainter(),
        ));
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  // Painter
  void paint(Canvas canvas, Size size) {
    //lapiz
    final paint = Paint();
    double x = size.width;
    double y = size.height;
    //Propiedades
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill; //.stroke .fill
    // Que tan anchi puede ser el lapiz
    paint.strokeWidth = 2;

    //Posicion del lapiz
    final path = new Path();
    // Dibujar con el path y el lápiz
    // path.moveTo(0, 0);
    path.lineTo(0, y * 0.25);
    path.quadraticBezierTo(x * 0.25, y * 0.30, x * 0.5, y * 0.25);
    path.quadraticBezierTo(x * 0.75, y * 0.20, x, y * 0.25);
    path.lineTo(x, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderWavePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderWavePainter oldDelegate) => false;
}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        //color: Color(0xff615AAB),
        child: CustomPaint(
          painter: _HeaderWaveGradientPainter(),
        ));
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  @override
  // Painter
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromCircle(
      center: Offset(0.0, 55.0),
      radius: 100,
    );

    final Gradient gradiente = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      //Puntos porcentuales donde trabajan
      // Si se agrega un nuevo color, se tiene que poner un nuevo stop
      stops: [
        0.2,
        0.5,
        1.0,
      ],
    );

    //lapiz
    final paint = Paint()..shader = gradiente.createShader(rect);
    double x = size.width;
    double y = size.height;
    //Propiedades
    // Se puede quitar el color puesto que ya el shader esta definido
    // paint.color = Colors.red;
    paint.style = PaintingStyle.fill; //.stroke .fill
    // Que tan anchi puede ser el lapiz
    paint.strokeWidth = 2;

    //Posicion del lapiz
    final path = new Path();
    // Dibujar con el path y el lápiz
    // path.moveTo(0, 0);
    path.lineTo(0, y * 0.25);
    path.quadraticBezierTo(x * 0.25, y * 0.30, x * 0.5, y * 0.25);
    path.quadraticBezierTo(x * 0.75, y * 0.20, x, y * 0.25);
    path.lineTo(x, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderWaveGradientPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderWaveGradientPainter oldDelegate) => false;
}
