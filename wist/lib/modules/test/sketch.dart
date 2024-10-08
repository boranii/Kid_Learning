import 'package:flutter/material.dart';
// import 'package:wist/shared/components/style/colors.dart';

class Sketch {
  final List<Offset> points;
  final Color color;
  final double size;

  Sketch({
   required this.points,
    this.color = Colors.tealAccent,
    this.size=23,
});
}