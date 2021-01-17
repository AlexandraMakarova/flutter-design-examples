import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
      ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (screenWidth > 500) {
      screenWidth = screenWidth - 300;
    }

    return Positioned(
      bottom: 30,
      child: Container(
        width: screenWidth,
        child: Row(
          children: <Widget>[
            Spacer(),
            PinterestMenu(
              showMenu: show,
              activeColor: appTheme.accentColor,
              backgroundColor: appTheme.scaffoldBackgroundColor,
              items: [
                PinterestButton(
                    icon: Icons.pie_chart,
                    onPressed: () {
                      print('Icon');
                    }),
                PinterestButton(
                  icon: Icons.search,
                  onPressed: () {
                    print('search');
                  },
                ),
                PinterestButton(
                    icon: Icons.notification_important,
                    onPressed: () {
                      print('notification_important');
                    }),
                PinterestButton(
                    icon: Icons.supervised_user_circle,
                    onPressed: () {
                      print('supervised_user_circle');
                    }),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {
  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = new ScrollController();
  double currentScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > currentScroll && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }
      currentScroll = controller.offset;
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
    int count;
    if (MediaQuery.of(context).size.width > 500) {
      count = 3;
    } else {
      count = 2;
    }

    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: count,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(1, index.isEven ? 1 : 2),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;
  bool get show => this._show;

  set show(bool value) {
    this._show = value;
    notifyListeners();
  }
}
