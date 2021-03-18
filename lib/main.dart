import 'package:design_app/src/theme/theme_changer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // Arabic, no country code
        const Locale('ru', 'RU'), // Arabic, no country code
      ],
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
      // routes: getAplicacionRoutes(),
      // onGenerateRoute: (RouteSettings settings) {
      //   print('Called route ${settings.name} ');
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => AlertPage());
      // },
    );
  }
}
