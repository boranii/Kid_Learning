import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wist/modules/storiesLevel.dart';

// import 'package:wist/my__icons_icons.dart';

import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../shard/styles/color.dart';
import '../shared/components/components.dart';
import 'Map_level.dart';

class Levels extends StatefulWidget {
  const Levels({super.key, required this.level});

  final int level;

  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var fill = AppCubit.get(context).fill;
        // var opacity = AppCubit.get(context).opacity;
        op(int index) => AppCubit.get(context).finished(index);
        levelFill(int index) => AppCubit.get(context).getFill(index);
        return DefaultTabController(
          initialIndex: widget.level,
          length: 2,
          child: Scaffold(
            // backgroundColor: ColorMain.colorMain.,
            appBar: AppBar(
              leading: const SizedBox(),
              leadingWidth: 0,
              bottom: const TabBar(
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(
                    text: 'القصص',
                  ),
                  Tab(
                    text: 'المراحل',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                const StoriesLevel(),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100.0),
                      child: Column(
                        children: [
                          levelRow(
                            firstLetter(
                              context,
                              opacity: AppCubit.get(context).opacity,
                              fill: levelFill(0),
                            ),
                            lettersOnTop(
                              index: 1,
                              value: 1,
                              context,
                              fill: levelFill(1),
                              opacity: op(1),
                              character: 'Duck',
                              dx: 40.0,
                              dy: -65.0,
                              letter: 'ب',
                            ),
                          ),
                          levelSize(),
                          levelRow(
                            lettersBottom(
                              index: 2,
                              value: 2,
                              context,
                              fill: levelFill(2),
                              opacity: op(2),
                              letter: 'ت',
                              character: 'Dragon',
                              dx: -30.0,
                              dy: 120.0,
                            ),
                            lettersBehind(
                              index: 3,
                              value: 3,
                              context,
                              fill: levelFill(3),
                              opacity: op(3),
                              letter: 'ث',
                              character: 'Fox',
                              dx: -50.0,
                              dy: -100.0,
                            ),
                          ),
                          levelSize(),
                          specialLevel(
                            character1: 'HappyRabbit',
                            letters: 'أ ب ت ث',
                            character2: 'HappyDuck',
                            dy3: -30.0,
                          ),
                          levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Camel',
                          //     letter: "ج",
                          //     dx: -40.0,
                          //     dy: 110.0,
                          //     h: -40.0,
                          //   ),
                          //   lettersBottom(
                          //     context,
                          //     character: 'Horse',
                          //     letter: 'ح',
                          //     dx: -85.0,
                          //     dy: 90.0,
                          //     h: -30.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'خ',
                          //     dx: 30.0,
                          //     dy: 80.0,
                          //     h: -10.0,
                          //   ),
                          //   lettersBehind(
                          //     context,
                          //     character: 'Hen',
                          //     letter: 'د',
                          //     dy: -70.0,
                          //     dx: 20.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // specialLevel(
                          //   letters: 'ج ح خ د',
                          //   dx2: 10.0,
                          //   character1: 'HappyHorse',
                          //   dy1: 20.0,
                          //   character2: 'HappySheep',
                          //   dx3: 20.0,
                          //   dy3: 20.0,
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Wolf',
                          //     letter: 'ذ',
                          //     dx: -90.0,
                          //     dy:120.0,
                          //   ),
                          //   lettersOnTop(
                          //     context,
                          //     character: 'Racoon',
                          //     letter: 'ر',
                          //     dx: -70.0,
                          //     dy: 80.0,
                          //     h: -20.0,
                          //     w: 10.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersOnTop(
                          //     context,
                          //     character: 'Giraffe',
                          //     letter: 'ز',
                          //     dy: 65.0,
                          //     w: -10.0,
                          //     h: -10.0,
                          //   ),
                          //   lettersOnTop(
                          //     context,
                          //     character: 'Fish',
                          //     letter: 'س',
                          //     dy: 130.0,
                          //     h: -20.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // specialLevel(
                          //   character1: 'HappyRacoon',
                          //   letters: 'ذ ر ز س',
                          //   character2: 'HappyGiraffe',
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersOnTop(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'ش',
                          //     dx: -70.0,
                          //     dy: -20.0,
                          //   ),
                          //   lettersBottom(
                          //     context,
                          //     character: 'Hawk',
                          //     letter: 'ص',
                          //     dx: -80.0,
                          //     dy: 50.0,
                          //     h: -30.0,
                          //     // w:20.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //       context,
                          //       character: 'Frog',
                          //       letter: 'َض',
                          //       dy: 110.0,
                          //       h: -20.0),
                          //   lettersBottom(
                          //     context,
                          //     character: 'Peacock',
                          //     letter: 'ط',
                          //     dx: -50.0,
                          //     dy: 80.0,
                          //     h: -20.0,
                          //     w: 10.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // specialLevel(
                          //   character1: 'Sheep',
                          //   letters: 'ش ص ض ط',
                          //   character2: 'Peacock',
                          //   size: true,
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Deer',
                          //     letter: 'ظ',
                          //     dx: 20.0,
                          //     dy: 50.0,
                          //   ),
                          //   lettersBottom(
                          //     context,
                          //     character: 'Spider',
                          //     letter: 'ع',
                          //     dx: -70.0,
                          //     dy: -50.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Crow',
                          //     letter: 'غ',
                          //     dx: 30.0,
                          //     dy: 110.0,
                          //   ),
                          //   lettersBottom(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'ف',
                          //     h: -20.0,
                          //     dx: -50.0,
                          //     dy: 80.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // specialLevel(
                          //   character1: 'Sheep',
                          //   letters: 'ظ ع غ ف',
                          //   character2: 'Deer',
                          //   dx3: -20.0,
                          //   flip2: true,
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'ق',
                          //     h: -20.0,
                          //     dy: 80.0,
                          //   ),
                          //   lettersBottom(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'ك',
                          //     h: -20.0,
                          //     dy: 80.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersOnTop(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'ل',
                          //     dx: -70.0,
                          //     dy: -30.0,
                          //   ),
                          //   lettersOnTop(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'م',
                          //     h: -30.0,
                          //     w: 20.0,
                          //     dx: -70.0,
                          //     dy: 70.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // specialLevel(
                          //   character1: 'Sheep',
                          //   flip1: true,
                          //   letters: 'ق ك ل م',
                          //   character2: 'Sheep',
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Sheep',
                          //     letter: 'ن',
                          //     h: -20.0,
                          //     dx: 10.0,
                          //     dy: 80.0,
                          //   ),
                          //   lettersBottom(
                          //     context,
                          //     character: "Sheep",
                          //     letter: 'ه',
                          //     dx: -70.0,
                          //     dy: 80.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // levelRow(
                          //   lettersBottom(
                          //     context,
                          //     character: 'Rhino',
                          //     letter: 'و',
                          //     h: -30.0,
                          //     dy: 80.0,
                          //     dx: 20.0,
                          //   ),
                          //   lettersOnTop(
                          //     context,
                          //     character: 'DragonFly',
                          //     letter: 'ي',
                          //     h: -20.0,
                          //     dx: -30.0,
                          //     dy: -30.0,
                          //   ),
                          // ),
                          // levelSize(),
                          // specialLevel(
                          //   character1: 'HappyDragonFly',
                          //   dx1: -20.0,
                          //   letters: 'ن ه و ي',
                          //   character2: 'HappyRhino',
                          //   dx3: 20.0,
                          // ),
                        ],
                      ),
                    ),
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

Widget firstLetter(BuildContext context,
    {double fill = 200, double opacity = 0.5}) {
  AppCubit.get(context).initIndex(0, 0);
  return InkWell(
    onTap: () {
      if (AppCubit.get(context).opacity == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapLevel(
              level: AppCubit.get(context).getLevel(0),
              levelIndex: AppCubit.get(context).getIndex(0),
            ),
          ),
        );
      }
    },
    child: Opacity(
      opacity: opacity,
      child: Container(
        // clipBehavior: Clip.antiAliasWithSaveLayer,
        width: 150,
        height: 200,
        // padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorMain.color0Orange,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: ColorMain.colorOrange,
            width: 5,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
              height: fill,
              width: 150,
              decoration: BoxDecoration(
                color: ColorMain.colorMain,
                borderRadius: BorderRadius.circular(30),
                // border: Border.all(
                //   color: ColorMain.colorOrange,
                //   width: 5,
                // ),
              ),
            ),
            SvgPicture.asset(
              'assets/characters/RabbitAndLetter.svg',
            ),
          ],
        ),
      ),
    ),
  );
}

Widget secondLetter() {
  return Container(
    width: 150,
    height: 200,
    // padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: ColorMain.color0Orange,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: ColorMain.colorOrange,
        width: 5,
      ),
    ),
    child: Stack(
      children: [
        Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
            color: ColorMain.colorMain,
            borderRadius: BorderRadius.circular(30),
            // border: Border.all(
            //   color: ColorMain.colorOrange,
            //   width: 5,
            // ),
          ),
        ),
        SizedBox(
          height: 100,
          width: 200,
          child: OverflowBox(
            maxHeight: 400,
            maxWidth: 400,
            minWidth: 250,
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(
              'assets/characters/Duck.svg',
            ),
          ),
        ),
        Center(
          child: SvgPicture.asset(
            'assets/letters/ب.svg',
          ),
        ),
      ],
    ),
  );
}

Widget thirdLetter() {
  return SizedBox(
    height: 200,
    child: Container(
      width: 150,
      height: 220,
// padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: ColorMain.color0Orange,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: ColorMain.colorOrange,
          width: 5,
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
              color: ColorMain.colorMain,
              borderRadius: BorderRadius.circular(30),
// border: Border.all(
//   color: ColorMain.colorOrange,
//   width: 5,
// ),
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/letters/ت.svg',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 210.0),
            child: OverflowBox(
              maxHeight: 210,
              maxWidth: 350,
// minHeight: 120,
              minWidth: 200,
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                allowDrawingOutsideViewBox: true,
                'assets/characters/Dragon.svg',
// height: 50,width: 50,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget fourthLetter() {
  return Container(
    width: 150,
    height: 200,
// padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: ColorMain.color0Orange,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: ColorMain.colorOrange,
        width: 5,
      ),
    ),
    child: Stack(
      children: [
        SizedBox(
          height: 100,
          width: 200,
          child: OverflowBox(
            maxHeight: 400,
            maxWidth: 400,
            minWidth: 250,
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              'assets/characters/Fox.svg',
            ),
          ),
        ),
        Container(
          height: 180,
          width: 150,
          decoration: BoxDecoration(
            color: ColorMain.colorMain,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Center(
          child: SvgPicture.asset(
            'assets/letters/ث.svg',
          ),
        ),
      ],
    ),
  );
}

Widget firstSpecial() {
  return Container(
    width: 340,
    height: 140,
// padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: ColorMain.colorBlue,
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.blue,
        width: 5,
      ),
    ),
    child: OverflowBox(
      maxWidth: 450,
      minWidth: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/characters/HappyRabbit.svg',
            ),
            Center(
              child: SvgPicture.asset(
                'assets/letters/أ ب ت ث.svg',
              ),
            ),
            SvgPicture.asset(
              'assets/characters/HappyDuck.svg',
            ),
          ],
        ),
      ),
    ),
  );
}
