import 'package:flutter/material.dart';

import '../../../size_config.dart';

class CircleImage extends StatelessWidget {
  String image;
  double height;
  double width;
  CircleImage({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: getProportionateScreenHeight(height),
      width: getProportionateScreenWidth(width),
      child: CircleAvatar(
        radius: 100,
        child: ClipOval(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: 80,
            height: 80,
          ),
        ),
      ),
    );
  }
}
