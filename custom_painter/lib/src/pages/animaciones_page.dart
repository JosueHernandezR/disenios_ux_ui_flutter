import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  // Control para iniciar, pausar
  AnimationController controller;
  // Animación
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    // Inicializar controller vsync fps
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    // Quien lo controla
    // Valores iniciales constantes
    // rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

    rotacion = Tween(begin: 0.0, end: 2 * Math.pi).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    // Cambia la opacidad del cuadrado
    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        // El intervalo va desde el 0 al 100% de la duración total
        // 0 a 1
        curve: Interval(
          0,
          0.25,
          curve: Curves.easeOut,
        ),
      ),
    );

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        // El intervalo va desde el 0 al 100% de la duración total
        // 0 a 1
        curve: Interval(
          0.75,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );

    //Mover el cuadrado a la derecha
    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    // Expandir el cuadrado
    // 2 veces el tamaño original
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    //Escucha que es lo que pasa en todas las etapas de la animación.
    controller.addListener(
      () {
        // print('Status: ${controller.status}');
        if (controller.status == AnimationStatus.completed) {
          //controller.reverse();
          controller.repeat();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //momento para iniciar la animacion
    //Play
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
            angle: rotacion.value,
            child: Opacity(
              opacity: opacidad.value - opacidadOut.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

// Cuadrado / rectangulo
class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
