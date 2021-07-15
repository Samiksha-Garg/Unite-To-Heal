import 'package:UniteToHeal/constants.dart';
import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({Key? key,required this.title, required this.icon, required this.obscureText, required this.control,required this.visible}) : super(key: key);

  final bool obscureText;
  final String title;
  final IconData icon;
  final TextEditingController control;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: kPurple,
        )
      ),
      child: Column(
        children: [
          TextField(
            controller: control,
            cursorColor: Colors.grey,
            obscureText: obscureText,
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(icon,color: Colors.grey,),
                hintText: title,
            ),
          ),
          Visibility(
            child: Text(
              'This field is mandatory',
              style: TextStyle(
                color: Colors.red
              )
            ),
            visible: visible,
          )
        ],
      ),
    );
  }
}
