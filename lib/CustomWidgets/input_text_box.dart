import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox({Key? key,required this.title, required this.icon, required this.obscureText}) : super(key: key);

  final bool obscureText;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        cursorColor: Colors.grey,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(icon,color: Colors.grey,),
            hintText: title
        ),
      ),
    );
  }
}
