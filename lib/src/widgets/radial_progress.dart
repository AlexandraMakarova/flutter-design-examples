import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryThicknes;
  final double secondaryThicknes;

  RadialProgress({
    @required this.percentage,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryThicknes = 10,
    this.secondaryThicknes = 3,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double previousPercentage;

  @override
  void initState() {
    previousPercentage = widget.percentage;
    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final differenceToAnimate = widget.percentage - previousPercentage;
    previousPercentage = widget.percentage;

    return AnimatedBuilder(
      animation: controller,
      // child: child,
      builder: (BuildContext context, Widget child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              (widget.percentage - differenceToAnimate) +
                  (differenceToAnimate * controller.value),
              widget.primaryColor,
              widget.secondaryColor,
              widget.primaryThicknes,
              widget.secondaryThicknes,
            ),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryThicknes;
  final double secondaryThicknes;

  _MyRadialProgress(
    this.percentage,
    this.primaryColor,
    this.secondaryColor,
    this.primaryThicknes,
    this.secondaryThicknes,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // final Rect rect = new Rect.fromCircle(
    //   center: Offset(0, 0),
    //   radius: 180,
    // );

    // final Gradient gradient = new LinearGradient(
    //   colors: <Color>[
    //     Color(0xff6D05E8),
    //     Color(0xffC012FF),
    //     Colors.green,
    //   ],
    // );
    // Circle
    final paint = new Paint()
      ..strokeWidth = secondaryThicknes
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final paintArc = new Paint()
      ..strokeWidth = primaryThicknes
      ..color = primaryColor
      // ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
