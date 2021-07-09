import 'package:flutter/material.dart';

class PaymentTile extends StatelessWidget {

  final String title;
  final bool? isChecked;
  final void Function(bool?)? function;

  const PaymentTile({Key? key,required this.title,required this.isChecked,required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'BonaNova'
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.white,
        checkColor: Colors.grey,
        value: isChecked,
        onChanged: function
      ),
    );
  }
}
