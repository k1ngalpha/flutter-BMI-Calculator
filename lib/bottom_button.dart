import 'package:flutter/material.dart';
import 'constants.dart';

class ButtomButton extends StatelessWidget {
  late final Function()? onTap;
  late final String buttonTitle;

  ButtomButton({required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonStyle,
          ),
        ),
        color: Color(0xFFEB1555),
        padding: EdgeInsets.only(bottom: 20.0),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity, //Stretched across the phone
        height: 80.0,
      ),
    );
  }
}
