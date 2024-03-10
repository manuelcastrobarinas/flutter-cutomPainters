import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin{
  double percent = 0;
  double newPercent = 10;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500),);

    animationController.addListener(() { 
      setState(() {
        percent = lerpDouble(percent, newPercent, animationController.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const StadiumBorder(),
        backgroundColor: Colors.pink,
        onPressed: () {
          percent = newPercent;
          (newPercent < 100) ? newPercent += 10 : newPercent = 0;
          animationController.forward(from: 0.0);
          setState(() {});
        },
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
      body: Center(
        child: Container(
          padding : const EdgeInsets.all(10.0),
          width : 300,
          height: 300,
          child: CustomPaint(
            painter: _MyRadialProgress(percent: percent),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double percent;
  _MyRadialProgress({required this.percent});
  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint()
    ..strokeWidth = 2
    ..color       = Colors.grey
    ..style       = PaintingStyle.stroke;
    
    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    double radius  = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
    ..strokeWidth = 6
    ..color       = Colors.blue
    ..style       = PaintingStyle.stroke;


    double arcoAngle = 2 * pi * (percent / 100); // definir la cantidad de llenado del arco

    canvas.drawArc( 
      Rect.fromCircle(center: center, radius: radius), //poner la posicion del arco
      - pi / 2, //angulo de inicio
      arcoAngle, 
      false,
      paintArco //paint del arco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}