

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/text_widget_text1.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    const SizedBox(
      height: 50,
    ),
    SvgPicture.asset("assets/icons/logo.svg"),
    const SizedBox(
      height: 20,
    ),
    TextSFProRounded(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      size: 25,
      title: 'Let’s Get Familiar',
    ),
    //const Text("let's Get Familiar"),
    const SizedBox(
      height: 20,
    ),

    TextSFProRounded(
      color: Color(0xFFF4E4B61),
      fontWeight: FontWeight.w400,
      size: 15,
      title: 'introduce Yourself',
    ),
      ],
    );
  }
}
