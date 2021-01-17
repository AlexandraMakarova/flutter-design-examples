import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  double percentage = 0.0;
  double newPercentage = 0.0;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    controller.addListener(() {
      setState(() {
        percentage = lerpDouble(percentage, newPercentage, controller.value);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: () {
          percentage = newPercentage;
          newPercentage += 10;
          if (percentage > 100) {
            newPercentage = 0;
            percentage = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(5),
            width: 300,
            height: 300,
            child: CustomPaint(
              painter: _MyRadialProgress(percentage),
            )),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final percentage;
  _MyRadialProgress(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    // Circle
    final paint = new Paint()
      ..strokeWidth = 3
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    // Arc
    final paintArc = new Paint()
      ..strokeWidth = 8
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

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
