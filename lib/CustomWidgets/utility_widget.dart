import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class UtilityWidget extends StatelessWidget {
  const UtilityWidget({Key? key,required this.width, required this.title, required this.image}) : super(key: key);

  final double width;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: ExactAssetImage(image),
            radius: width,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: width * 1.5,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: kPurple
            ),
            child: Material(
              color: kPurple,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rakkas",
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
