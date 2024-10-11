import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//1664c4 main color (Button color)
Color colormain = const Color(0xffF6E2D7);
Color colorprogres = const Color(0xffF1CBB7);
Color colorprogres1 = const Color(0xff667BC6);
Color taxtcolor = const Color(0xff3AA6D9);
Color chekecolor = const Color(0xffF1E6E0);
Color chekecolor2 = const Color(0xff5ABFA2);
Color iconcolor = const Color(0xFFF3A54D);
Color color0Orange =  const Color(0x99da9b5b);

class ColorMain {
  static var colorMain = HexColor("F1E6E0");
  static var colorOrange = HexColor("EB9F4A");
  static const Color  colorOrangeConst = Color(0xffEB9F4A);
  static var colorBlue = HexColor("72A2FF");
  static var colorLBlue = HexColor("3AA6D9");
  static var color0Orange = const Color(0x99eb9f4a);
  static var color0O = const Color(0xffe7b791);
  static const Color colorGreen = const Color(0xff5ABFA2);
}

const MaterialColor maintheme = MaterialColor(_mainPrimaryValue, <int, Color>{
  50: Color(0xFFFDFCFB),
  100: Color(0xFFFBF8F6),
  200: Color(0xFFF8F3F0),
  300: Color(0xFFF5EEE9),
  400: Color(0xFFF3EAE5),
  500: Color(_mainPrimaryValue),
  600: Color(0xFFEFE3DC),
  700: Color(0xFFEDDFD8),
  800: Color(0xFFEBDBD3),
  900: Color(0xFFE7D5CB),
});
const int _mainPrimaryValue = 0xFFF1E6E0;

const MaterialColor mainAccent = MaterialColor(_mainAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_mainAccentValue),
  400: Color(0xFFFFFFFF),
  700: Color(0xFFFFFFFF),
});
const int _mainAccentValue = 0xFFFFFFFF;
