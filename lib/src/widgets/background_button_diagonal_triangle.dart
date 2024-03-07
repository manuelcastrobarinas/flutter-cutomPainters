import 'package:flutter/material.dart';

class BackgroundButtonDiagonalTriangle extends StatelessWidget {
  const BackgroundButtonDiagonalTriangle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width : double.infinity,
      child : CustomPaint(
        painter: _BackgroundButtonDiagonalTrianglePainter(),
      ) ,
    );
  }
}

class _BackgroundButtonDiagonalTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path  = Path();

    paint.color = Colors.blue;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }

}