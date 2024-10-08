// import 'dart:async';

import 'package:flutter/material.dart';

class WaterAnimation extends StatefulWidget {
  const WaterAnimation({super.key});

  @override
  State<WaterAnimation> createState() => _WaterAnimationState();
}

class _WaterAnimationState extends State<WaterAnimation>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation firstAnimation;

  late AnimationController secondController;
  late Animation secondAnimation;

  late AnimationController thirdController;
  late Animation thirdAnimation;

  late AnimationController fourthController;
  late Animation fourthAnimation;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   firstController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(
  //       milliseconds: 1500,
  //     ),
  //   );
  //   firstAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
  //       CurvedAnimation(parent: firstController, curve: Curves.easeInOut)
  //         ..addListener(
  //           () {
  //             setState(() {});
  //           },
  //         )
  //         ..addStatusListener(
  //           (status) {
  //             if (status == AnimationStatus.completed) {
  //               firstController.reverse();
  //             } else if (status == AnimationStatus.dismissed) {
  //               firstController.forward();
  //             }
  //           },
  //         ));
  //
  //   secondController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(
  //       milliseconds: 1500,
  //     ),
  //   );
  //   secondAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
  //       CurvedAnimation(parent: secondController, curve: Curves.easeInOut)
  //         ..addListener(
  //           () {
  //             setState(() {});
  //           },
  //         )
  //         ..addStatusListener(
  //           (status) {
  //             if (status == AnimationStatus.completed) {
  //               secondController.reverse();
  //             } else if (status == AnimationStatus.dismissed) {
  //               secondController.forward();
  //             }
  //           },
  //         ));
  //
  //   thirdController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(
  //       milliseconds: 1500,
  //     ),
  //   );
  //   thirdAnimation = Tween<double>(begin: 1.8, end: 2.4).animate(
  //       CurvedAnimation(parent: thirdController, curve: Curves.easeInOut)
  //         ..addListener(
  //           () {
  //             setState(() {});
  //           },
  //         )
  //         ..addStatusListener(
  //           (status) {
  //             if (status == AnimationStatus.completed) {
  //               thirdController.reverse();
  //             } else if (status == AnimationStatus.dismissed) {
  //               thirdController.forward();
  //             }
  //           },
  //         ));
  //
  //   fourthController = AnimationController(
  //     vsync: this,
  //     duration: const Duration(
  //       milliseconds: 1500,
  //     ),
  //   );
  //   fourthAnimation = Tween<double>(begin: 1.9, end: 2.1).animate(
  //       CurvedAnimation(parent: fourthController, curve: Curves.easeInOut)
  //         ..addListener(
  //           () {
  //             setState(() {});
  //           },
  //         )
  //         ..addStatusListener(
  //           (status) {
  //             if (status == AnimationStatus.completed) {
  //               fourthController.reverse();
  //             } else if (status == AnimationStatus.dismissed) {
  //               fourthController.forward();
  //             }
  //           },
  //         ));
  //
  //   Timer(
  //     const Duration(seconds: 2),
  //     () {
  //       firstController.forward();
  //     },
  //   );
  //
  //   Timer(
  //     const Duration(milliseconds: 1600),
  //     () {
  //       secondController.forward();
  //     },
  //   );
  //
  //   Timer(
  //     const Duration(milliseconds: 800),
  //     () {
  //       thirdController.forward();
  //     },
  //   );
  //
  //   fourthController.forward();
  // }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff2b2c56),
      body: Stack(
        children: [
          Center(
            child: Text(
              "50 %",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                wordSpacing: 3,
                color: Colors.white.withOpacity(0.7),
              ),
              textScaler: const TextScaler.linear(7),
            ),
          ),
          RepaintBoundary(
            child: CustomPaint(
              painter: MyPainter(
                2,2,2,2,
                // firstAnimation.value,
                // secondAnimation.value,
                // thirdAnimation.value,
                // fourthAnimation.value,
              ),
              child: SizedBox(
                height: size.height,
                width: size.width,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;

  MyPainter(
    this.firstValue,
    this.secondValue,
    this.thirdValue,
    this.fourthValue,
  );

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xff3b6aba).withOpacity(.8)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(
        size.width * .4,
        size.height / secondValue,
        size.width * .7,
        size.height / thirdValue,
        size.width,
        size.height / fourthValue,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
