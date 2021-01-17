import 'package:design_app/src/theme/theme_changer.dart';
import 'package:design_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;
    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      Expanded(child: MySlideShow()),
      Expanded(child: MySlideShow()),
    ];
    return Scaffold(
        body: (isLarge)
            ? Column(children: children)
            : Row(
                children: children,
              ));
  }
}

class MySlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      primaryBullet: 18,
      secondaryBullet: 12,
      dotsOnTop: false,
      primaryColor: (appTheme.darkTheme) ? accentColor : Colors.deepPurple,
      // secondaryColor: Colors.grey,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/img-1.svg'),
        SvgPicture.asset('assets/svgs/img-2.svg'),
        SvgPicture.asset('assets/svgs/img-3.svg'),
        SvgPicture.asset('assets/svgs/img-4.svg'),
        SvgPicture.asset('assets/svgs/img-5.svg'),
      ],
    );
  }
}
