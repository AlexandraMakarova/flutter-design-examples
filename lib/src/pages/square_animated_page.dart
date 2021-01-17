import 'package:flutter/material.dart';

class SquareAnimatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _SquareAnimated(),
      ),
    );
  }
}

class _SquareAnimated extends StatefulWidget {
  @override
  __SquareAnimatedState createState() => __SquareAnimatedState();
}

class __SquareAnimatedState extends State<_SquareAnimated>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> moveToRight;
  Animation<double> moveUp;
  Animation<double> moveToLeft;
  Animation<double> moveDown;

  @override
  void initState() {
    controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4500),
    );

    moveToRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0, 0.25, curve: Curves.bounceOut),
    ));

    moveUp = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.25, 0.5, curve: Curves.bounceOut),
    ));

    moveToLeft = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.5, 0.75, curve: Curves.bounceOut),
    ));

    moveDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
    ));

    controller.addListener(() {
      print('Status: ${controller.status}');
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
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangle(),
      builder: (BuildContext context, Widget childRectangle) {
        return Transform.translate(
          offset: Offset(moveToRight.value + moveToLeft.value,
              moveUp.value + moveDown.value),
          child: childRectangle,
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
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
