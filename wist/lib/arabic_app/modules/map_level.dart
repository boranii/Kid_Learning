// import 'package:flutter/gestures.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:wist/my__icons_icons.dart';
// import 'package:wist/shared/components/style/colors.dart';
// import 'dart:ui';

import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wist/arabic_app/modules/Level.dart';
// import 'package:level_map/utils/image_offset_extension.dart';
import '../../my__icons_icons.dart';
import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../shard/styles/color.dart';

class MapLevel extends StatelessWidget {
  final int levelIndex;
  final int level;
  const MapLevel({super.key , required this.levelIndex,required this.level});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var level = AppCubit.get(context).level;
        // log('${AppCubit.get(context).level}');
        log('${levelIndex}',name:'map levelindex');
        log('${level}',name:'map level');

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading:Padding(
              padding: const EdgeInsets.symmetric(vertical:10.0),
              child: CircleAvatar(
                backgroundColor: ColorMain.colorOrange,
                radius: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Levels(level:1)));
                  },
                  icon: const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(
                      My_Icons.buttonarrowleft,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ) ,
            leadingWidth:100 ,
            toolbarHeight:80,
          ),
          body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/RabbitAndFlower.svg',
                      height: 200,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SvgPicture.asset(
                      'assets/BoySitting.svg',
                      height: 200,
                    ),
                  ],
                ),
                Expanded(
                  child: CustomPaint(
                    painter: LinePainter(),
                    child: MapLevels(level:level,levelIndex: levelIndex,),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    // if (kDebugMode) {
    //   print(size.height);
    //   print(size.width);
    // }
    path.moveTo(size.width - 150, size.height - 50);
    path.quadraticBezierTo(
      size.width - 50,
      size.height - 50,
      size.width - 50,
      size.height - 150,
    );
    path.moveTo(size.width - 50, size.height - 150);
    path.quadraticBezierTo(
      size.width - 100,
      size.height - 200,
      size.width - 150,
      size.height - 200,
    );
    path.moveTo(size.width - 150, size.height - 200);
    path.quadraticBezierTo(
      size.width - 150,
      size.height - 270,
      size.width - 50,
      size.height - 300,
    );
    path.moveTo(size.width - 50, size.height - 300);
    path.quadraticBezierTo(
      size.width - 70,
      size.height - 350,
      size.width - 150,
      size.height - 350,
    );
    path.moveTo(size.width - 150, size.height - 350);
    path.quadraticBezierTo(
      size.width - 120,
      size.height - 450,
      size.width - 50,
      size.height - 450,
    );
    path.moveTo(size.width - 50, size.height - 450);
    path.quadraticBezierTo(
      size.width - 50,
      size.height - 500,
      size.width - 150,
      size.height - 550,
    );
    Paint paint = Paint()
      ..color = ColorMain.colorBlue
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);
    // canvas.drawPoints(PointMode.polygon, [
    //   const Offset(0.0,-10.0),
    //   const Offset(10.0,-20.0),
    //   const Offset(20.0,-50.0),
    //   const Offset(70.0,-100.0),
    // ], paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    // throw UnimplementedError();
  }
}
