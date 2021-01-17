import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/radial_progress.dart';

class CircularGraphsPage extends StatefulWidget {
  @override
  _CircularGraphsPageState createState() => _CircularGraphsPageState();
}

class _CircularGraphsPageState extends State<CircularGraphsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) {
              percentage = 0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                  percentage: percentage, color: Colors.deepPurple),
              CustomRadialProgress(
                  percentage: percentage * 1.2, color: Colors.teal),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(
                  percentage: percentage * 1.5, color: Colors.pink[400]),
              CustomRadialProgress(
                  percentage: percentage * 1.8, color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final Color color;

  const CustomRadialProgress({
    @required this.percentage,
    @required this.color,
  });

  final double percentage;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 180,
      height: 180,
      child: RadialProgress(
          percentage: percentage,
          primaryColor: this.color,
          secondaryColor: appTheme.accentColor,
          primaryThicknes: 5,
          secondaryThicknes: 2),
      // child: Text('$percentage %', style: TextStyle(fontSize: 50.0)),
    );
  }
}
