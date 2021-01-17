import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/circular_graphs_page.dart';
import '../pages/emergency_page.dart';
import '../pages/headers_page.dart';
import '../pages/pinterest_page.dart';
import '../pages/slideshow_page.dart';
import '../pages/sliver_list_page.dart';
import '../pages/square_animated_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergency', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Animated square', SquareAnimatedPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Progress bar', CircularGraphsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
