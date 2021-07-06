import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:UniteToHeal/constants.dart';

class SingleTextLogo extends StatelessWidget {
  const SingleTextLogo({Key? key, required this.size,required this.image,required this.title}) : super(key: key);

  final Size size;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: size.width * 0.50,
          backgroundColor: kPrimaryColor,
          child: CircleAvatar(
            radius: size.width * 0.35,
            backgroundImage: ExactAssetImage(image),
          ),
        ),
        Positioned(
          top: 25,
          child: CircularText(
            children: [
              TextItem(
                text: Text(
                  title.toUpperCase(),
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
          ),
        )
      ],
    );
  }
}
