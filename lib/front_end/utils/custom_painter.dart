import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zfuel/front_end/constants/export_constant.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3;

    Offset startingPoint = Offset(
      0,
      AppDimensions.deviceHeight,
    );
    Offset endingPoint = Offset(
      size.width,
      size.height - AppDimensions.height200,
    );

    canvas.drawLine(startingPoint, endingPoint, paint);

    // Draw dashed line
    Path dashedPath = Path();
    dashedPath.moveTo(
        0,
        (AppDimensions.deviceHeight + size.height - AppDimensions.height200) /
            2);
    dashedPath.lineTo(
        size.width,
        (size.height -
                AppDimensions.height200 +
                size.height -
                AppDimensions.height200 * 2) /
            2);

    PathMetrics pathMetrics = dashedPath.computeMetrics();
    List<Offset> points = [];

    for (PathMetric pathMetric in pathMetrics) {
      for (double i = 0; i < pathMetric.length; i += 10) {
        Tangent tangent = pathMetric.getTangentForOffset(i)!;

        points.add(tangent.position);
      }
    }

    canvas.drawPoints(PointMode.points, points, paint);

    double lineGap = AppDimensions.height200;
    Offset startingPoint2 = Offset(
      0,
      size.height - lineGap,
    );
    Offset endingPoint2 = Offset(
      size.width,
      size.height - lineGap * 2,
    );
    canvas.drawLine(startingPoint2, endingPoint2, paint);

    Path path = Path();
    path.moveTo(startingPoint.dx, startingPoint.dy);
    path.lineTo(startingPoint2.dx, startingPoint2.dy);
    path.lineTo(endingPoint2.dx, endingPoint2.dy);
    path.lineTo(endingPoint.dx, endingPoint.dy);
    path.close();
    paint.style = PaintingStyle.fill;
    paint.color = AppColors.kRoadColor.withOpacity(0.24);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
