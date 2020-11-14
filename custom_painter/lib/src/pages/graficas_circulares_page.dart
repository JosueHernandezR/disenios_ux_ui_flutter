import 'package:custom_painter/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10.0;
            if (porcentaje > 100.0) {
              porcentaje = 0.0;
            }
          });
        },
      ),
      body: Center(
          child: Container(
        width: 300,
        height: 300,
        child: RadialProgress(
          porcentaje: porcentaje,
          colorPrimario: Colors.green,
          colorSecundario: Colors.black,
          grosorArco: 15.0,
          grosorFondo: 10.0,
          border: StrokeCap.round,
        ),
      )),
    );
  }
}
