import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appCurrentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        backgroundColor: appCurrentTheme.accentColor,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.eltiempo.com/files/image_950_534/files/crop/uploads/2017/08/23/599d8b441cb67.r_1542070445691.0-319-2942-1790.jpeg'),
              radius: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text(
                'SL',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: appCurrentTheme.dividerColor,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/gifs/loading2.gif'),
          fadeInDuration: Duration(milliseconds: 300),
          image: NetworkImage(
              'https://media.newyorker.com/photos/601b3f81c02421087e98c66f/master/pass/210215_r37910.jpg'),
        ),
      ),
    );
  }
}
