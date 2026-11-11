
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:periodcare/core/theme/app_colors.dart';

class DashedCircle extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  const DashedCircle({
    super.key,
    this.size = 100,
    this.color = AppColors.secondary,
    this.strokeWidth = 2,
    this.dashLength = 6,
    this.gapLength = 4,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _DashedCirclePainter(
          color: color,
          strokeWidth: strokeWidth,
          dashLength: dashLength,
          gapLength: gapLength,
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double gapLength;

  _DashedCirclePainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.gapLength,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.shortestSide - strokeWidth) / 2;

    final circumference = 2 * pi * radius;
    final dashCount = (circumference / (dashLength + gapLength)).floor();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < dashCount; i++) {
      final startAngle = (2 * pi * i) / dashCount;
      final sweepAngle = dashLength / radius;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) {
    return color != oldDelegate.color ||
        strokeWidth != oldDelegate.strokeWidth ||
        dashLength != oldDelegate.dashLength ||
        gapLength != oldDelegate.gapLength;
  }
}
