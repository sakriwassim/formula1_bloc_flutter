import 'dart:async';
import 'package:block_breakingbad_flutter/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _navigatettohomepage() {
    Timer(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigatettohomepage();

    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Center(
            child: Container(
              // color: Colors.blue,
              child: SvgPicture.asset("assets/icons/logo2.svg"),
            ),
          ),
        ));
  }
}
