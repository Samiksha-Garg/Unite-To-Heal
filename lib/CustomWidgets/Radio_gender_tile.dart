import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';


class RadioGenderTile extends StatelessWidget {
  const RadioGenderTile({Key? key,required this.groupValue,required this.value,required this.function,required this.title}) : super(key: key);

  final  groupValue;
  final  value;
  final  function;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<Gender>(
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
