import 'package:flutter/material.dart';
import '../constants.dart';

class MissionList extends StatelessWidget {
  const MissionList({Key? key,required this.point}) : super(key: key);

  final String point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: Row(
          children: [
            Image.asset('assets/images/bullet_point.jpeg',width: 20,height: 20,),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Card(
                elevation: 0.9,
                color: Color(0xffCE97B0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    point,
                    style: TextStyle(
                        height: 1.5,
                        fontSize: 20,
                        fontFamily: 'Acme',
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Image.asset('assets/images/bullet_point.jpeg',width: 20,height: 20,)
          ],
        ),
      ),
    );
  }
}
