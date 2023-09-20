import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  primaryColor: const Color(0xFFF6F1F1),
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.grey,
  cardColor: const Color(0xFF001f70),
  canvasColor: Colors.black,
  indicatorColor: const Color.fromARGB(255, 224, 221, 221),
);

final darkTheme = ThemeData(
  primaryColor: Color.fromARGB(255, 28, 30, 79),
  primaryColorLight: Color.fromARGB(255, 84, 87, 153),
  primaryColorDark: Colors.grey,
  cardColor: Colors.white,
  canvasColor: Colors.white,
  indicatorColor: Color.fromARGB(255, 71, 72, 127),
);
