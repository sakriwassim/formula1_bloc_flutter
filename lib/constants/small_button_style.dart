import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  double height;
  double? width;
  double fontSize;
  dynamic fontWeight;
  LinearGradient? gradientbackground;
  Color? backgroundcolor;
  Color? textcolor;

  Button(
      {Key? key,
      required this.text,
      required this.textcolor,
      required this.height,
      this.width,
      required this.fontSize,
      this.gradientbackground,
      required this.fontWeight,
      this.backgroundcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(10),
        gradient: gradientbackground,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textcolor),
        ),
      ),
    );
  }
}
