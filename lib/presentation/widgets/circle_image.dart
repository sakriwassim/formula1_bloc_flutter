import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'image_cached_internet.dart';

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
        child: ClipOval(
          child: ImageCachedInternet(
            height: MediaQuery.of(context).size.height,
            imageUrl: '$image',
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
