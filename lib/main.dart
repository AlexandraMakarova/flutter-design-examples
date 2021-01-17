import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './src/pages/launcher_page.dart';
import './src/pages/launcher_tablet_page.dart';
import 'src/models/layout_model.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeChanger>(create: (_) => ThemeChanger(1)),
        ChangeNotifierProvider<LayoutModel>(
          create: (_) => LayoutModel(),
        )
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Desing App',
      home: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          final screenSize = MediaQuery.of(context).size;
          return Container(
            child: (screenSize.width > 500)
                ? LauncherTabletPage()
                : LauncherPage(),
          );
        },
      ),
    );
  }
}
