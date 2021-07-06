import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class BlogCard extends StatelessWidget {

  final String title;
  final Color color;

  const BlogCard({Key? key,required this.title,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        width: 160,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 35,
                    color: kDarkBlue,
                    fontFamily: 'Rakkas'
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
