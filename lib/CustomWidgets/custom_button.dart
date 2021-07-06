import 'package:flutter/material.dart';
import 'package:UniteToHeal/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,required this.title,required this.function}) : super(key: key);

  final String title;
  final void Function ()? function;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.70,
      height: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPurple,
          border: Border.all(
            color: kPrimaryColor.withAlpha(90),
            width: 8,
          )
      ),
      child: Material(
        color: kPurple,
        child: InkWell(
          onTap: function,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: "Acme",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
