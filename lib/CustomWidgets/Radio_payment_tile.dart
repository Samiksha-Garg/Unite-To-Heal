import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class RadioPayment extends StatelessWidget {

  final  groupValue;
  final  value;
  final  function;
  final String title;

  const RadioPayment({Key? key,required this.groupValue,required this.value,required this.function,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<Payment>(
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
