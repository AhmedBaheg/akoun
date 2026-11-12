import 'package:flutter/material.dart';

class AuthDashedDivider extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  const AuthDashedDivider({
    super.key,
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: thickness,
      child: CustomPaint(
        painter: AuthDashedDividerPainter(
          color: color,
          dashWidth: dashWidth,
          dashSpace: dashSpace,
          thickness: thickness,
        ),
      ),
    );
  }
}

class AuthDashedDividerPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double thickness;

  AuthDashedDividerPainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
    required this.thickness,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.square;

    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset((startX + dashWidth).clamp(0, size.width), 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant AuthDashedDividerPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashSpace != dashSpace ||
        oldDelegate.thickness != thickness;
  }
}
