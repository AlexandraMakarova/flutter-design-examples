import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';
import '../../src/widgets/headers.dart';
import '../../src/widgets/big_button.dart';

class ItemBoton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final items = <ItemBoton>[
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
      new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
          Color(0xff6989F5), Color(0xff906EF5)),
      new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency',
          Color(0xff66A9F2), Color(0xff536CF6)),
      new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
          Color(0xffF2D572), Color(0xffE06AA3)),
      new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
          Color(0xff46997D)),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 300),
              child: BigButton(
                icon: item.icon,
                text: item.text,
                color1: item.color1,
                color2: item.color2,
                onPress: () {
                  print(item.text);
                },
              ),
            ))
        .toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: (isLarge) ? 220 : 10),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  if (isLarge) SizedBox(height: 80),
                  ...itemMap,
                ],
              ),
            ),
          ),
          if (isLarge) _Header()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Medical Assistance',
          subtitle: 'Ask for help',
          color1: Color(0xff66A9F2),
          color2: Color(0xff536CF6),
        ),
        Positioned(
            right: 0,
            top: 45,
            child: RawMaterialButton(
              onPressed: () {},
              shape: CircleBorder(),
              padding: EdgeInsets.all(15),
              child: FaIcon(
                FontAwesomeIcons.ellipsisV,
                color: Colors.white,
              ),
            ))
      ],
    );
  }
}

class BigButtonTemp extends StatelessWidget {
  const BigButtonTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BigButton(
      icon: FontAwesomeIcons.userSecret,
      text: 'Stranger follows you',
      color1: Colors.lime[50],
      color2: Colors.red[700],
      onPress: () {
        print('Ask for help');
      },
    );
  }
}

class PageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        subtitle: 'Ask for help',
        title: 'Medical Assistance',
        color1: Color(0xff6613C9),
        color2: Color(0xffA66CFF),
      ),
    );
  }
}
