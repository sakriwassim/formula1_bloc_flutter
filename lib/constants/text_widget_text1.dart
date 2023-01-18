// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextSFProRounded extends StatelessWidget {
  String title;
  double size;
  Color? color;
  FontWeight fontWeight;

  TextSFProRounded({
    Key? key,
    required this.title,
    required this.size,
    required this.color,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'SFProRounded',
        fontWeight: fontWeight,
        fontSize: size,
        color: color,
      ),
    );
  }
}
