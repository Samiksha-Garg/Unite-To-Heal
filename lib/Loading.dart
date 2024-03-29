import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Center(
        child: SpinKitChasingDots(
          color: kPurple,
          size: 50.0,
        ),
      ),
    );
  }
}
