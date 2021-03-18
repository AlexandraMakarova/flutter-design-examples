import 'package:design_app/src/pages/animated_container.dart';
import 'package:design_app/src/pages/card_page.dart';
import 'package:design_app/src/pages/input_page.dart';
import 'package:design_app/src/pages/listview_page.dart';
import 'package:design_app/src/pages/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/alert_page.dart';
import '../pages/avatar_page.dart';
import '../pages/circular_graphs_page.dart';
import '../pages/emergency_page.dart';
import '../pages/headers_page.dart';
import '../pages/pinterest_page.dart';
import '../pages/slideshow_page.dart';
import '../pages/sliver_list_page.dart';
import '../pages/square_animated_page.dart';

final pageRoutes = <_Route>[
  _Route('Alert', AlertPage(), FontAwesomeIcons.exclamation),
  _Route('Animated container', AnimatedContainerPage(), Icons.donut_large),
  _Route('Animated square', SquareAnimatedPage(), FontAwesomeIcons.peopleCarry),
  _Route('Avatar', AvatarPage(), FontAwesomeIcons.user),
  _Route('Cards', CardPage(), FontAwesomeIcons.folder),
  _Route('Emergency', EmergencyPage(), FontAwesomeIcons.ambulance),
  _Route('Inputs', InputPage(), Icons.input),
  _Route('Headers', HeadersPage(), FontAwesomeIcons.heading),
  _Route('Lists and scrolls', ListPage(), FontAwesomeIcons.list),
  _Route('Pinterest', PinterestPage(), FontAwesomeIcons.pinterest),
  _Route('Progress bar', CircularGraphsPage(), FontAwesomeIcons.circleNotch),
  _Route('Slideshow', SlideshowPage(), FontAwesomeIcons.slideshare),
  _Route('Sliders', SliderPage(), FontAwesomeIcons.slidersH),
  _Route('Slivers', SliverListPage(), FontAwesomeIcons.mobile),
];

class _Route {
  final String title;
  final Widget page;
  final IconData icon;

  _Route(this.title, this.page, this.icon);
}

// Map<String, WidgetBuilder> getAplicacionRoutes() {
//   return <String, WidgetBuilder>{
//     '/': (BuildContext context) => LauncherPage(),
//   };
// }
