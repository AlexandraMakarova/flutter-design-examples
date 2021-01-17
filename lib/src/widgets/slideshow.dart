import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import '../../src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsOnTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  Slideshow({
    @required this.slides,
    this.dotsOnTop = false,
    this.primaryColor = Colors.deepPurple,
    this.secondaryColor = Colors.grey,
    this.primaryBullet = 12.0,
    this.secondaryBullet = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideshowModel>(context)._primaryColor =
                  this.primaryColor;
              Provider.of<_SlideshowModel>(context)._secondaryColor =
                  this.secondaryColor;
              Provider.of<_SlideshowModel>(context)._primaryBullet =
                  this.primaryBullet;
              Provider.of<_SlideshowModel>(context)._secondaryBullet =
                  this.secondaryBullet;
              return _CreateStructureSlideShow(
                dotsOnTop: dotsOnTop,
                slides: slides,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CreateStructureSlideShow extends StatelessWidget {
  final bool dotsOnTop;
  final List<Widget> slides;

  const _CreateStructureSlideShow({this.dotsOnTop, this.slides});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (this.dotsOnTop)
          _Dots(
            this.slides.length,
          ),
        Expanded(
          child: _Slides(this.slides),
        ),
        if (!this.dotsOnTop)
          _Dots(
            this.slides.length,
          ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int slidesLength;

  _Dots(
    this.slidesLength,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            this.slidesLength,
            (index) => _Dot(
                  index,
                )),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int pageIndex;

  _Dot(
    this.pageIndex,
  );

  @override
  Widget build(BuildContext context) {
    final slideshowModel = Provider.of<_SlideshowModel>(context);

    double size;
    Color color;

    if (slideshowModel.currentPage >= pageIndex - 0.5 &&
        slideshowModel.currentPage < pageIndex + 0.5) {
      size = slideshowModel._primaryBullet;
      color = slideshowModel._primaryColor;
    } else {
      size = slideshowModel._secondaryBullet;
      color = slideshowModel._secondaryColor;
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final pageViewController = new PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30),
      child: slide,
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.teal;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => this._currentPage;

  set currentPage(double page) {
    this._currentPage = page;
    notifyListeners();
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color primaryColor) {
    this._primaryColor = primaryColor;
  }

  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color primaryColor) {
    this._secondaryColor = secondaryColor;
  }

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double size) {
    this._primaryBullet = size;
    // notifyListeners();
  }

  double get secondaryBullet => this._secondaryBullet;

  set secondaryBullet(double size) {
    this._secondaryBullet = size;
    // notifyListeners();
  }
}
