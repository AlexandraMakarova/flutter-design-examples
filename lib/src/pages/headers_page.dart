// import 'package:design_app/src/theme/theme_changer.dart';
// import 'package:provider/provider.dart';

import '../widgets/headers.dart';
import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      // body: HeaderSquare(),
      // body: HeaderRoundedBorders(),
      // body: HeaderDiagonal(),
      // body: HeaderTriangle(),
      // body: HeaderPeak(),
      // body: HeaderCurve(),
      // body: HeaderWave(color: appTheme.accentColor),
      // body: HeaderInverseWave(),
      body: HeaderWaveGradient(),
    );
  }
}
