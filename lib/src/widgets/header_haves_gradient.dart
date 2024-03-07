import 'package:flutter/material.dart';

class HeaderWavesGradient extends StatelessWidget {
  const HeaderWavesGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width : double.infinity,
      child : CustomPaint(
        painter: _HeaderWavesGradientPainter(),
      ),
    );
  }
}

class _HeaderWavesGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    
    final rect = Rect.fromCircle(
      center: const Offset(0, 40),
      radius: 180
    );

    const Gradient gradient =  LinearGradient(
      begin : Alignment.topCenter,
      end   : Alignment.bottomCenter,
      colors: <Color> [
        Color.fromARGB(255, 255, 0, 0),
        Color.fromARGB(255, 255, 162, 0),
        Color.fromARGB(255, 255, 241, 187),
      ],
      stops: [
        0.2,
        0.5,
        1.0
      ]
    );

    final paint = Paint()..shader = gradient.createShader(rect);
    final path  = Path();

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    path.lineTo(0, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.2, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
  
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }

}