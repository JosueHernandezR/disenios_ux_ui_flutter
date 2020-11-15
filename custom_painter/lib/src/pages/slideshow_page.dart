import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:custom_painter/src/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: MiSlideShow()),
        Expanded(child: MiSlideShow())
      ]),
    );
  }
}

class MiSlideShow extends StatelessWidget {
  const MiSlideShow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      puntosArriba: false,
      colorPrimario: Color(0xffFF5A7E),
      //colorSecundario: Colors.grey,
      bulletPrimario: 15.0,
      bulletSecundario: 10.0,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
