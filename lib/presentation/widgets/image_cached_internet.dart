import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCachedInternet extends StatelessWidget {
  String imageUrl;
  double width;
  double height;

  ImageCachedInternet({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: height,
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
    );
  }
}
