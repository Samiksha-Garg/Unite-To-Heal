import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:UniteToHeal/constants.dart';

class LogoAvatar extends StatelessWidget {
  const LogoAvatar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: size.width * 0.50,
          backgroundColor: kPrimaryColor,
          child: CircleAvatar(
            radius: size.width * 0.35,
            backgroundImage: ExactAssetImage('assets/images/home_icon.jpeg'),
          ),
        ),
        Positioned(
          top: 25,
            child: CircularText(
              children: [
                TextItem(
                    text: Text(
                      'Unite To Heal'.toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        color: kDarkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  space: 12,
                  startAngle: -90,
                  startAngleAlignment: StartAngleAlignment.center,
                  direction: CircularTextDirection.clockwise,
                ),
              ],
              radius: size.width*0.45,
            )
        ),
        Positioned(
            child: CircularText(
              children: [
                TextItem(
                  text: Text(
                    'Together We Can Heal'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 22,
                      color: kDarkBlue,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript'
                    ),
                  ),
                  space: 7,
                  startAngle: 90,
                  startAngleAlignment: StartAngleAlignment.center,
                  direction: CircularTextDirection.anticlockwise,
                ),
              ],
              radius: size.width*0.45,
            )
        ),
      ],
    );
  }
}
