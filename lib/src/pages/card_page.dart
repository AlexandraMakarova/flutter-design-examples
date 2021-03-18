import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardType1(context),
          SizedBox(height: 30.0),
          _cardType2(context),
          SizedBox(height: 30.0),
          _cardType1(context),
          SizedBox(height: 30.0),
          _cardType2(context),
          SizedBox(height: 30.0),
          _cardType1(context),
          SizedBox(height: 30.0),
          _cardType2(context),
        ],
      ),
    );
  }

  Widget _cardType1(BuildContext context) {
    final appCurrentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading:
                Icon(Icons.photo_album, color: appCurrentTheme.accentColor),
            title: Text('Card Title'),
            subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque semper ante vitae interdum congue. Curabitur odio arcu, consectetur ut eros a, malesuada venenatis nibh. Morbi sodales auctor malesuada.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(onPressed: () {}, child: Text('Cancel')),
              TextButton(onPressed: () {}, child: Text('OK')),
            ],
          ),
        ],
      ),
    );
  }

  _cardType2(BuildContext context) {
    final _card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/gifs/loading.gif'),
          image: NetworkImage(
              'https://i.pinimg.com/originals/00/9c/5b/009c5b88c763973dacc71cfcd64994e6.jpg'),
          fadeInDuration: Duration(milliseconds: 500),
          height: 250.0,
          fit: BoxFit.cover,
        ),
        Container(
            padding: EdgeInsets.all(10.0), child: Text('Something interesting'))
      ]),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: _card,
      ),
    );
  }
}
