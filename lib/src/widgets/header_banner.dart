import 'package:flutter/material.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width : double.infinity,
      child : CustomPaint(
        painter: _HeaderBannerPainter(),
      ) ,
    );
  }
}

class _HeaderBannerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path  = Path();

    paint.color = Colors.pinkAccent;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    path.lineTo(0, size.height * 0.2);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }

}