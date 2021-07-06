import 'package:flutter/material.dart';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class ContactUsBubble extends StatelessWidget {
  const ContactUsBubble({Key? key,required this.icon,required this.info}) : super(key: key);

  final IconData icon;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: BubbleEdges.only(bottom: 15),
      nip: BubbleNip.leftTop,
      color: kDarkBlue,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              info,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Rakkas'
              ),
            ),
          )
        ],
      ),
    );
  }
}