import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../routes/routes.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appCurrentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appCurrentTheme.accentColor,
        centerTitle: true,
        title: Text('Flutter designs components - Mobile'),
      ),
      drawer: _PrincipalMenu(),
      body: _OptionsList(),
    );
  }
}

class _OptionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: appTheme.dividerColor,
      ),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: appTheme.accentColor),
        title: Text(
          pageRoutes[index].title,
          style: TextStyle(color: appTheme.textTheme.bodyText1.color),
        ),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pageRoutes[index].page));
        },
      ),
      itemCount: pageRoutes.length,
    );
  }
}

class _PrincipalMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;
    final primaryColor = appTheme.currentTheme.primaryColor;

    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text(
                    'AM',
                    style: TextStyle(
                        fontSize: 40,
                        color: appTheme.currentTheme.dividerColor),
                  ),
                ),
              ),
            ),
            Expanded(child: _OptionsList()),
            ListTile(
              leading: Icon(
                Icons.lightbulb_outline,
                color: accentColor,
              ),
              title: Text(
                (appTheme.darkTheme && !appTheme.customTheme) ||
                        (appTheme.darkTheme && appTheme.customTheme)
                    ? 'Light mode'
                    : 'Dark Mode',
                style: TextStyle(color: primaryColor),
              ),
              trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                onChanged: (value) => appTheme.darkTheme = value,
                activeColor: accentColor,
              ),
            ),
            SafeArea(
              bottom: true,
              left: false,
              right: false,
              top: false,
              child: ListTile(
                leading: Icon(
                  Icons.add_to_home_screen,
                  color: accentColor,
                ),
                title: Text(
                    appTheme.customTheme ? 'Default Theme' : 'Custom Theme',
                    style: TextStyle(color: primaryColor)),
                trailing: Switch.adaptive(
                  value: appTheme.customTheme,
                  onChanged: (value) {
                    appTheme.customTheme = value;
                  },
                  activeColor: accentColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
