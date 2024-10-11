import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../modules/test/sketch.dart';

class PointData {
  final Offset offset;
  final Color color;

  PointData(this.offset, this.color);
}

class DrawingApp extends HookWidget {
  final ValueNotifier<Sketch?> currentSketch;

  final ValueNotifier<List<Sketch>> allSketches;

  const DrawingApp({
    super.key,
    required this.allSketches,
    required this.currentSketch,
  });

  bool comparePoints(List<Offset> point1, List<Offset> point2) {
    // Implement your comparison logic here. This example checks for a distance threshold
    double distance = sqrt(pow(point1.first.dx - point2.first.dx, 2) +
        pow(point1.first.dy - point2.first.dy, 2));
    // print( 'Num : $distance');
    return distance < 10.0; // Overlap if distance is less than 10
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildAllPaths(),
        buildCurrentPath(
          context,
        ),
        // Container(
        //   margin:EdgeInsets.only(left: 100),
        //   color:Colors.amber,
        //   height: 300,
        //   width: 150,
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         for (int i = 0; i < allSketches.value.length; i++)
        //           Padding(
        //             padding: const EdgeInsets.only(left: 50),
        //             child: Text(
        //               "Point ${i + 1}: ${comparePoints(currentSketch.value!.points, allSketches.value.first.points) ? "Overlaps" : "No Overlap"}",
        //             ),
        //           ),
        //       ],
        //     ),
        //   ),
        // ),

      ],
    );
  }

  Widget buildAllPaths() {
    return RepaintBoundary(
      child: CustomPaint(
        painter: SketchPainter(
          sketches: allSketches.value,
        ),
      ),
    );
  }

  Widget buildCurrentPath(
    BuildContext context,
  ) {
    return Listener(
      onPointerDown: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);

        currentSketch.value = Sketch(
          points: [offset],
        );
      },
      onPointerMove: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);

        final points = List<Offset>.from(currentSketch.value?.points ?? [])
          ..add(offset);
        currentSketch.value = Sketch(
          points: points,
        );
      },
      onPointerUp: (details) {
        allSketches.value = List<Sketch>.from(allSketches.value)
          ..add(currentSketch.value!);
      },
      child: RepaintBoundary(
        child: SizedBox(
          height: 250,
          width: 100,
          child: CustomPaint(
            painter: SketchPainter(
              sketches:
                  currentSketch.value == null ? [] : [currentSketch.value!],
            ),
          ),
        ),
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  final List<Sketch> sketches;

  SketchPainter({
    required this.sketches,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (Sketch sketch in sketches) {
      final points = sketch.points;
      final path = Path();
      path.moveTo(points.first.dx, points.first.dy);
      // path.moveTo(50.4, 34.7);

      for (int i = 1; i < points.length - 1; ++i) {
        final p0 = points[i];
        final p1 = points[i + 1];

        // print(path.contains(Offset(50, 50)).toString());
        path.lineTo(p0.dx, p1.dy);
        // path.quadraticBezierTo(
        //   p0.dx,
        //   p0.dy,
        //   (p0.dx + p1.dx) / 2,
        //   (p0.dy + p1.dy) / 2,
        // );
      }

      path.shift(const Offset(50, 0));
      // path.shift(Offset(50,50));

      Paint paint = Paint()
        ..color = sketch.color
        ..strokeWidth = sketch.size
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke
      ;

      canvas.drawPath(path, paint);
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
