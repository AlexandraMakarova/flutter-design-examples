import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliverListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _Title(),
      // body: _TaskList(),
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _ButtonNewList(),
          ),
        ],
      ),
    );
  }
}

class _ButtonNewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      minWidth: size.width * 0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {},
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.accentColor
            : Color(0xffED6762),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
        child: Text(
          'Create new list',
          style: TextStyle(
              color: appTheme.currentTheme.scaffoldBackgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
    _ListItem('Orange', Color(0xffF08F66)),
    _ListItem('Family', Color(0xffF2A38A)),
    _ListItem('Subscriptions', Color(0xffF7CDD5)),
    _ListItem('Books', Color(0xffFCEBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    final appCurrentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            minHeight: 190,
            maxHeight: 210,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appCurrentTheme.scaffoldBackgroundColor,
              child: _Title(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100),
          ]),
        )
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => (minHeight > maxHeight) ? minHeight : maxHeight;

  @override
  double get minExtent => (minHeight > maxHeight) ? maxHeight : minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minExtent ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: <Widget>[
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Text(
            'New',
            style: TextStyle(
              color: (appTheme.darkTheme) ? Colors.grey : Color(0xff532128),
              fontSize: 50,
            ),
          ),
        ),
        Stack(
          children: <Widget>[
            SizedBox(
              width: 100,
            ),
            Positioned(
              bottom: 10,
              child: Container(
                width: 120,
                height: 8,
                color: (appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text(
                'List',
                style: TextStyle(
                    color: Color(0xffD93A30),
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
      ],
    );
  }
}

// class _TaskList extends StatelessWidget {
//   final items = [
//     _ListItem('Orange', Color(0xffF08F66)),
//     _ListItem('Family', Color(0xffF2A38A)),
//     _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     _ListItem('Books', Color(0xffFCEBAF)),
//     _ListItem('Orange', Color(0xffF08F66)),
//     _ListItem('Family', Color(0xffF2A38A)),
//     _ListItem('Subscriptions', Color(0xffF7CDD5)),
//     _ListItem('Books', Color(0xffFCEBAF)),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (BuildContext context, int index) => items[index],
//     );
//   }
// }

class _ListItem extends StatelessWidget {
  final String title;
  final Color color;

  const _ListItem(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme) ? Colors.grey : this.color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
