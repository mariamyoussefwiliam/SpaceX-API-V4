import 'package:flutter/material.dart';

const Color primaryColor = Color(0xff07919C);
const Color secondaryColor = Color(0xff3FB8C0);
const shadowColor = Color.fromRGBO(143, 148, 251, .2);
const gradientColor = LinearGradient(
  begin: Alignment(0.0, -1.0),
  end: Alignment(0.0, 1.0),
  colors: [Color(0xff3FB8C0), Color(0xff0399A0), Color(0xff07919c)],
);

const MaterialColor color = MaterialColor(
  0xff07919C,
  <int, Color>{
    50: Color(0xff079191), //10%
    100: Color(0xff079192), //20%
    200: Color(0xff079193), //30%
    300: Color(0xff079194), //40%
    400: Color(0xff079195), //50%
    500: Color(0xff07919C), //60%
    600: Color(0xff07919C), //70%
    700: Color(0xff07919C), //80%
    800: Color(0xff07919C), //90%
    900: Color(0xff07919C), //100%
  },
);
