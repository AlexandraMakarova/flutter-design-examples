import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({
    @required this.onPressed,
    @required this.icon,
  });
}

class PinterestMenu extends StatelessWidget {
  final bool showMenu;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<PinterestButton> items;

  PinterestMenu({
    this.showMenu = true,
    this.activeColor = Colors.teal,
    this.inactiveColor = Colors.blueGrey,
    this.backgroundColor = Colors.white,
    @required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: (showMenu) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
            Provider.of<_MenuModel>(context).activeColor = this.activeColor;
            Provider.of<_MenuModel>(context).inactiveColor = this.inactiveColor;
            Provider.of<_MenuModel>(context).backgroundColor =
                this.backgroundColor;

            return _PinterestMenuBackground(
              child: _MenuItems(items),
            );
          },
        ),
      ),
    );
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  _PinterestMenuBackground({@required this.child});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Provider.of<_MenuModel>(context).backgroundColor;

    return Container(
      child: child,
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ]),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        menuItems.length,
        (i) => _PinterestMenuButton(i, menuItems[i]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final menuItem = Provider.of<_MenuModel>(context);
    final itemSelected = menuItem.menuItemSelected;

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).menuItemSelected =
            index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          item.icon,
          size: (itemSelected == index) ? 35 : 25,
          color: (itemSelected == index)
              ? menuItem.activeColor
              : menuItem.inactiveColor,
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _menuItemSelected = 0;
  Color activeColor = Colors.teal;
  Color inactiveColor = Colors.blueGrey;
  Color backgroundColor = Colors.white;

  int get menuItemSelected => this._menuItemSelected;

  set menuItemSelected(int index) {
    this._menuItemSelected = index;
    notifyListeners();
  }
}
