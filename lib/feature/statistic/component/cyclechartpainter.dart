import 'package:flutter/material.dart';
import 'package:periodcare/core/theme/app_colors.dart';
import 'dart:math';

class CycleChartPainter extends CustomPainter {
  final List<int> cycleDuration;
  final List<int> periodDuration;
  final List<DateTime> dateStart;

  CycleChartPainter({
    required this.cycleDuration,
    required this.periodDuration,
    required this.dateStart,
  });

  static const Color maroon = AppColors.primary;
  static const Color lightPink = AppColors.secondary;

  @override
  void paint(Canvas canvas, Size size) {
    final maxValueCycle = cycleDuration.reduce(max);
    final maxValuePeriod = periodDuration.reduce(max);

    final width = size.width;
    final height = size.height;

    const bottomPadding = 20.0;
    const topPadding = 20.0;
    final baseline = height - bottomPadding;
    final count = cycleDuration.length;
    final spacing = width / count;

    final chartHeight = baseline - topPadding;

    final highestY = baseline -
    (maxValueCycle / maxValueCycle * chartHeight);


    // Paint garis horizontal putus-putus
    final dashedPaint = Paint()
      ..color = lightPink
      ..strokeWidth = 2;

    double dashX = 0;

    while (dashX < width) {
      canvas.drawLine(
        Offset(dashX, highestY), 
        Offset(dashX + 8, highestY), 
        dashedPaint);
      dashX += 15;
    }

    // Paint baseline
    final baselinePaint = Paint()
      ..color = const Color(0xFFF0EAE8)
      ..strokeWidth = 1.5;

    canvas.drawLine(
      Offset(0, baseline),
      Offset(width, baseline),
      baselinePaint,
    );

    final points = <Offset>[];

    // Menggambar batang dan titik grafik
    for (int i = 0; i < count; i++) {
      final x = spacing * (i + 0.5);

      final y = baseline - (cycleDuration[i] / maxValueCycle * chartHeight);

      final point = Offset(x, y);
      points.add(point);

      // Batang transparan
      final barRect = RRect.fromRectAndRadius(
        Rect.fromLTRB(x - 10, y, x + 10, baseline),
        const Radius.circular(20),
      );

      final barPaint = Paint()..color = lightPink.withAlpha(150);

      canvas.drawRRect(barRect, barPaint);

      // Bar maroon di bagian bawah
      final bottomBarHeight =
    (periodDuration[i] / maxValuePeriod) * chartHeight * 0.5;

      final bottomBar = RRect.fromRectAndRadius(
        Rect.fromLTWH(x - 10, baseline - bottomBarHeight, 20, bottomBarHeight),
        const Radius.circular(13),
      );

      canvas.drawRRect(bottomBar, Paint()..color = maroon);
    }

    // Membuat garis lengkung
    final path = Path();

    path.moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = points[i];
      final p2 = points[i + 1];

      final dx = (p2.dx - p1.dx) * 0.50;

      path.cubicTo(p1.dx + dx, p1.dy, p2.dx - dx, p2.dy, p2.dx, p2.dy);
    }

    final linePaint = Paint()
      ..color = maroon
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, linePaint);

    // Menggambar titik lingkaran
    for (int i = 0; i < points.length; i++) {
      final point = points[i];

      // Lingkaran putih di tengah
      canvas.drawCircle(point, 6, Paint()..color = Colors.white);

      // Lingkaran bagian luar
      canvas.drawCircle(
        point,
        6,
        Paint()
          ..color = maroon
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3,
      );

      // Titik terakhir berwarna maroon
      if (i == points.length - 1) {
        canvas.drawCircle(point, 6, Paint()..color = maroon);

        // Lingkaran bagian luar
        canvas.drawCircle(
          point,
          6,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CycleChartPainter oldDelegate) {
    return oldDelegate.cycleDuration != cycleDuration ||
        oldDelegate.periodDuration != periodDuration ||
        oldDelegate.dateStart != dateStart;
  }
}
