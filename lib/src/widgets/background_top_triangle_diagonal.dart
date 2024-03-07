import 'package:flutter/material.dart';

class BackgroundTopTriangleDiagonal extends StatelessWidget {
  const BackgroundTopTriangleDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width : double.infinity,
      child: CustomPaint(
        painter: _BackgroundTopTriangleDiagonalPainter(),
      ),
    );
  }
}

class _BackgroundTopTriangleDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path  = Path();

    paint.color = const Color(0xFF673AB7);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}