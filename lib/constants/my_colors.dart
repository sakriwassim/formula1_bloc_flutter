import 'package:flutter/material.dart';

class MyColors {
  static const Color myYellow = Color(0xffFFC107);
  static const Color myGrey = Color(0xfffED4040);
  static const Color myWhite = Color(0xffE1E8EB);
}

InputDecoration decoration(String text) {
  return InputDecoration(
    labelText: text,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 3,
        color: Colors.greenAccent,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:
          const BorderSide(width: 3, color: Color.fromARGB(31, 0, 0, 0)),
    ),
  );
}

const gradientbackground = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: <Color>[
    Color(0xFFFB61E1E),
    Color(0xFFFF94646),
    Color(0xFFFF94646),
  ],
);

// LinearGradient(
//   colors: [Color.fromARGB(236, 0, 0, 0), Color(0xfffED4040)],
// );
const gradientbackgroundticket = LinearGradient(
  colors: [Color.fromARGB(255, 25, 1, 204), Color.fromARGB(255, 6, 2, 83)],
);

final Shader linearGradient = const LinearGradient(
  colors: <Color>[
    Color.fromRGBO(131, 1, 188, 1),
    Color.fromRGBO(210, 40, 106, 1)
  ],
).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
