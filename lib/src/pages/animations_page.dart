import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;

  Animation<double> opacity;
  Animation<double> opacityOut;

  Animation<double> moveToRight;
  Animation<double> enlarge;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.25, curve: Curves.easeOut),
    ));

    opacityOut = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 1.0, curve: Curves.easeOut),
    ));

    moveToRight = Tween(begin: 0.0, end: 200.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    enlarge = Tween(begin: 0.0, end: 2.0).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    controller.addListener(() {
      // print('Status: ${controller.status}');

      if (controller.status == AnimationStatus.completed) {
        // controller.repeat();
        //  controller.reverse();
        //  controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    controller.forward();
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget childRectangle) {
        return Transform.translate(
          offset: Offset(moveToRight.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value - opacityOut.value,
              child: Transform.scale(
                scale: enlarge.value,
                child: childRectangle,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.teal),
    );
  }
}
