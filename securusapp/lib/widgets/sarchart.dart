import 'package:flutter/material.dart';

class PieChartData {
  const PieChartData(this.color, this.percent);

  final Color color;
  final double percent;
}

class PieChart extends StatelessWidget {
  const PieChart({
    super.key,
    required this.data,
    required this.radius,
    this.strokeWidth = 10,
    this.child,
  });

  final List<PieChartData> data;
  final double radius;
  final double strokeWidth;
  final Widget? child;

  @override
  Widget build(context) {
    return CustomPaint(
      painter: _Painter(strokeWidth, data),
      size: Size.square(radius),
      child: SizedBox.square(
          // calc diameter
          dimension: radius * 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [const SizedBox(height: 70.0), child!],
          )),
    );
  }
}

class _PainterData {
  const _PainterData(this.paint, this.radians);

  final Paint paint;
  final double radians;
}

class _Painter extends CustomPainter {
  _Painter(double strokeWidth, List<PieChartData> data) {
    // convert chart data to painter data
    dataList = data
        .map((e) => _PainterData(
              Paint()
                ..color = e.color
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth
                ..strokeCap = StrokeCap.round,
              // remove padding from stroke
              (e.percent - _padding) * _percentInRadians,
            ))
        .toList();
  }

  static const _percentInRadians = 0.062831853071796 / 1.74;
  static const _padding = 4;
  static const _startAngle = 1.570796 * 2;

  late final List<_PainterData> dataList;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    double startAngle = _startAngle;

    for (final data in dataList) {
      final path = Path()..addArc(rect, startAngle, data.radians);

      startAngle += data.radians + 0.05;

      canvas.drawPath(path, data.paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
