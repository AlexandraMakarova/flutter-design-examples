import 'package:flutter/material.dart';
import 'package:design_app/src/theme/theme_changer.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 150.0;
  bool _blockedCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            _createCheckBox(),
            _createSwitch(),
            Expanded(
              child: _createImage(),
            ),
            SafeArea(child: _ceateSlider()),
          ],
        ),
      ),
    );
  }

  Widget _ceateSlider() {
    final accentColor =
        Provider.of<ThemeChanger>(context).currentTheme.accentColor;

    return Slider(
      label: 'Image size',
      // divisions: 20,
      activeColor: accentColor,
      value: _sliderValue,
      min: 100.0,
      max: 450.0,
      onChanged: (_blockedCheck)
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _createImage() {
    return FadeInImage(
      placeholder: AssetImage('assets/gifs/loading2.gif'),
      image: NetworkImage(
          'https://www.pngjoy.com/pngl/286/16671281_sid-the-sloth-about-transparent-png.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //     value: _blockedCheck,
    //     onChanged: (value) {
    //       setState(() {
    //         _blockedCheck = value;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Block slider'),
        value: _blockedCheck,
        onChanged: (value) {
          setState(() {
            _blockedCheck = value;
          });
        });
  }

  _createSwitch() {
    return SwitchListTile(
        title: Text('Block slider'),
        value: _blockedCheck,
        onChanged: (value) {
          setState(() {
            _blockedCheck = value;
          });
        });
  }
}
