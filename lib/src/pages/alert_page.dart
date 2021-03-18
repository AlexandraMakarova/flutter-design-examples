import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appCurrentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        centerTitle: true,
        backgroundColor: appCurrentTheme.accentColor,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlert(context);
          },
          style: ElevatedButton.styleFrom(
              primary: appCurrentTheme.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              textStyle: TextStyle(color: Colors.white)),
          child: Text('Show alert'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    final appCurrentTheme =
        Provider.of<ThemeChanger>(context, listen: false).currentTheme;

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text('Title'),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'Mauris malesuada, dolor sed mattis finibus, nunc leo pulvinar est.'),
                FlutterLogo(
                  size: 100.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Ok',
                        style: TextStyle(color: appCurrentTheme.accentColor),
                      ),
                    ),
                    TextButton(
                      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: appCurrentTheme.accentColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
