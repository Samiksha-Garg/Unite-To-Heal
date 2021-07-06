import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class RadioOccTile extends StatelessWidget {

  const RadioOccTile({Key? key,required this.groupValue,required this.value,required this.function,required this.title}) : super(key: key);

  final  groupValue;
  final  value;
  final  function;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<Occupation>(
          value: value,
          groupValue: groupValue,
          onChanged:function ,
          activeColor: Colors.white,
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'BonaNova'
          ),
        )
      ],
    );
  }
}
