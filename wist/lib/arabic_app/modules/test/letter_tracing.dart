import 'dart:developer';

import 'package:flutter/material.dart';

class TracingLetterA extends StatefulWidget {
  const TracingLetterA({super.key});

  @override
  _TracingLetterAState createState() => _TracingLetterAState();
}

class _TracingLetterAState extends State<TracingLetterA> {
  List<Offset> _points = [];  // Store the points of the user's drawing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learn ABC"),
      ),
      body: Column(
        children: [
          // Custom paint for tracing the letter A
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  // Get the local position of the touch event
                  RenderBox renderBox = context.findRenderObject() as RenderBox;
                  Offset localPosition = renderBox.globalToLocal(details.globalPosition);
                  log("Touch at: $localPosition",name: 'onPanUpdate');  // Debugging: Print touch points
                  _points.add(localPosition);
                });
              },
              onPanEnd: (details) {
                setState(() {
                  _points.add(Offset(-1, -1));  // Add a separator point to break lines between strokes
                });
              },
              child:Container(
                color: Colors.cyan,  // Background color
                width: double.infinity,
                height: double.infinity,
                child:CustomPaint(
                  painter: LetterPainter(_points),
                ),
              ),
            ),
          ),
          // Prompt or Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Learn ABC Game using Flutter",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class LetterPainter extends CustomPainter {
  final List<Offset> points;
  LetterPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    // Paint the dashed guide for the letter 'A'
    Paint guidePaint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4.0;

    Path letterAPath = Path();
    letterAPath.moveTo(size.width * 0.5, size.height * 0.1);
    letterAPath.lineTo(size.width * 0.3, size.height * 0.8);
    letterAPath.lineTo(size.width * 0.7, size.height * 0.8);
    letterAPath.moveTo(size.width * 0.4, size.height * 0.5);
    letterAPath.lineTo(size.width * 0.6, size.height * 0.5);

    // Draw the guide path
    canvas.drawPath(letterAPath, guidePaint);

    // Paint the user's trace
    Paint tracePaint = Paint()
      ..color = Colors.yellow
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6.0;

    // Draw the points traced by the user
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset(-1, -1) && points[i + 1] != Offset(-1, -1)) {
        canvas.drawLine(points[i], points[i + 1], tracePaint);
      }
    }
  }

  @override
  bool shouldRepaint(LetterPainter oldDelegate) => true;
}
