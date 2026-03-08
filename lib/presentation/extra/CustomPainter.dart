
import 'package:flutter/material.dart';


class Singleton {
  static final Singleton _singleton = Singleton._internal();
  Singleton._internal();
  static Singleton get instance => _singleton;
  Rect rect = Rect.zero;
}



class OverlayScreen extends StatelessWidget {
  const OverlayScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Center(

        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context). size. width,
              height: (MediaQuery.of(context). size. width/4)*3,
              child: CustomPaint(
                painter: PainterTwo(),
              ),
            ),
          ],)
    ) ;
  }
}

class PainterTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    Path path = Path();
    Singleton.instance.rect = Rect.fromLTWH(
        0, 0.2*size.height/2 , size.width , (size.width/4)*3 );
    path.addRRect(RRect.fromRectAndRadius(
        Singleton.instance.rect,
        const Radius.circular(1)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}