import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HeaderSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderRoundedBorders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(75),
          bottomRight: Radius.circular(75),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Brush propierties:
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //borders only
    paint.style = PaintingStyle.fill; //filles inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    // Draw with path and brush:
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTrianglePainter(),
      ),
    );
  }
}

class _HeaderTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Brush propierties:
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //borders only
    paint.style = PaintingStyle.fill; //filles inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    // Right Triangle:
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);

    // // Left Triangle:
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);
    // // path.lineTo(0, size.height * 0.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPeak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPeakPainter(),
      ),
    );
  }
}

class _HeaderPeakPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Brush propierties:
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //borders only
    paint.style = PaintingStyle.fill; //fills inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    // path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvePainter(),
      ),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Brush propierties:
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //borders only
    paint.style = PaintingStyle.fill; //fills inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    // path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5, // Point of curve on X
      size.height * 0.40, // Point of curve on Y
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  final Color color;
  const HeaderWave({@required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(this.color),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  final Color color;
  _HeaderWavePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Brush propierties:
    // paint.color = Color(0xff615AAB);
    paint.color = this.color;
    // paint.style = PaintingStyle.stroke; //borders only
    paint.style = PaintingStyle.fill; //fills inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25, // Point of curve on X
      size.height * 0.30, // Point of curve on Y
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75, // Point of curve on X
      size.height * 0.20, // Point of curve on Y
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderInverseWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderInverseWavePainter(),
      ),
    );
  }
}

class _HeaderInverseWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Brush propierties:
    paint.color = Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke; //borders only
    paint.style = PaintingStyle.fill; //fills inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
      size.width * 0.25, // Point of curve on X
      size.height * 0.65, // Point of curve on Y
      size.width * 0.5,
      size.height * 0.75,
    );
    path.quadraticBezierTo(
      size.width * 0.75, // Point of curve on X
      size.height * 0.85, // Point of curve on Y
      size.width,
      size.height * 0.75,
    );
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(
            appTheme.dividerColor, appTheme.accentColor, appTheme.primaryColor),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  final Color dividerColor;
  final Color accentColor;
  final Color primaryColor;

  _HeaderWaveGradientPainter(
      this.dividerColor, this.accentColor, this.primaryColor);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 55),
      radius: 180,
    );

    final Gradient gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          dividerColor,
          primaryColor,
          accentColor,
        ],
        stops: [
          0.1,
          0.4,
          0.8
        ]);
    final paint = Paint()..shader = gradient.createShader(rect);

    //Brush propierties:
    paint.style = PaintingStyle.fill; //fills inside of lines
    paint.strokeWidth = 20;

    final path = new Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.25, // Point of curve on X
      size.height * 0.30, // Point of curve on Y
      size.width * 0.5,
      size.height * 0.25,
    );
    path.quadraticBezierTo(
      size.width * 0.75, // Point of curve on X
      size.height * 0.20, // Point of curve on Y
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color1;
  final Color color2;

  const IconHeader({
    @required this.icon,
    @required this.title,
    @required this.subtitle,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
  });

  @override
  Widget build(BuildContext context) {
    final Color whiteColor = Colors.white.withOpacity(0.7);
    return Stack(
      children: <Widget>[
        _IconHeaderBackground(
          color1: this.color1,
          color2: this.color2,
        ),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(this.icon,
                size: 250, color: Colors.white.withOpacity(0.2))),
        Column(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              this.subtitle,
              style: TextStyle(fontSize: 20, color: whiteColor),
            ),
            SizedBox(height: 20),
            Text(
              this.title,
              style: TextStyle(
                  fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            FaIcon(
              this.icon,
              size: 75,
              color: Colors.white,
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    @required this.color1,
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          color: Colors.deepPurple[700],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              this.color1,
              this.color2,
            ],
          )),
    );
  }
}
