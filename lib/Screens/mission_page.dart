import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';
import 'package:UniteToHeal/CustomWidgets/custom_widgets.dart';

class MissionPage extends StatelessWidget {
  const MissionPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: SingleTextLogo(size: size, image: 'assets/images/ribbon_heart.jpg',title: 'We heal as one',),
            ),
            MissionList(point: agendas[0]),
            MissionList(point: agendas[1]),
            MissionList(point: agendas[2])
          ],
        ),
      ),
    );
  }
}
