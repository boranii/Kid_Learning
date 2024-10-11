import 'dart:developer';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wist/arabic_app/modules/Level.dart';
import '../../../my__icons_icons.dart';
import '../../models/onboarding.dart';
import '../../models/story.dart';
import '../../modules/drawingPage.dart';
import '../../modules/fathaLevel.dart';
import '../../modules/map_level.dart';
import '../../modules/kasrahLevel.dart';
import '../../modules/soundLevel.dart';
import '../../modules/thmahLevel.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../styles/color.dart';

// class Story extends StatefulWidget {
//   final String text;
//   final String svgAsset;
//
//
//   const Story({
//     Key? key,
//     required this.text,
//     required this.svgAsset,
//
//   }) : super(key: key);
//
//   @override
//   State<Story> createState() => _StoryState();
// }
//
// class _StoryState extends State<Story> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: ColorMain.color0Orange,
//           width: 4,
//         ),
//         borderRadius: BorderRadius.circular(15.0),
//         color: color0Orange,
//       ),
//       width: 343,
//       height: 85,
//       child: GestureDetector(
//         onTap: () {},
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   width: 4.0,
//                   color: isChecked ? chekecolor2 : ColorMain.color0Orange,
//                 ),
//                 color: chekecolor,
//               ),
//               child: Transform.scale(
//                 scale: 2.5,
//                 child: Checkbox(
//                   value: isChecked,
//                   checkColor: chekecolor2,
//                   side: BorderSide.none,
//                   shape: CircleBorder(),
//                   onChanged: (newBool) {
//                     setState(() {
//                       isChecked = newBool!;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Container(
//               height: 150,
//               width: 73,
//               child: OverflowBox(
//                 maxHeight: 400,
//                 maxWidth: 400,
//                 minWidth: 50,
//                 alignment: Alignment.bottomRight,
//                 child: SvgPicture.asset(
//                   widget.svgAsset,
//                 ),
//               ),
//             ),
//             Text(
//               widget.text,
//               style: TextStyle(
//                 color: taxtcolor,
//                 fontSize: 20,
//                 fontFamily: "Blabeloo",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget progras({
  double? width,
  double? heigth = 8,
}) =>
    Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: colorprogres,
          ),
          width: 226,
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15), topLeft: Radius.circular(15)),
            color: colorprogres1,
          ),
          width: width,
          height: 24,
        )
      ],
    );

Widget defultButton({
  bool enabled = true,
  required Function() pagename,
  required String text,
  Color color = ColorMain.colorOrangeConst,
}) =>
    Container(
      width: 250,
      height: 80,
      decoration: BoxDecoration(
        color: enabled ? color : Colors.grey,
        borderRadius: BorderRadius.circular(40),
      ),
      child: MaterialButton(
        onPressed: pagename,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontFamily: "Blabeloo",
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              // const SizedBox(width:20),
              const Icon(
                My_Icons.arrows,
                color: Colors.white,
                weight: 50,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );

// Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(50.0),
//     ),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     width: 275,
//     height: 80,
//     child: MaterialButton(
//       elevation: 0.0,
//       color: iconcolor,
//       onPressed: pagename,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             text,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//                 fontFamily: 'Blabeloo'),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Icon(
//             Icons.arrow_forward_ios,
//             color: Colors.white,
//           ),
//         ],
//       ),
//     ));

successDialog(BuildContext context, int levelIndex) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: ColorMain.colorMain,
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(20.0, -100.0),
                child: SvgPicture.asset(
                  'assets/Stars.svg',
                  height: 150,
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: SvgPicture.asset(
                              'assets/Reload 2.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            child: SvgPicture.asset('assets/levelButton.svg'),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/Gift.svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: onBoardingButton(
                        context,
                        () {
                          AppCubit.get(context).levelUp(levelIndex);
                          // if (AppCubit.get(context).level <= 7) {
                          //   AppCubit.get(context).level = AppCubit.get(context).level + 1;
                          // }
                          // AppCubit.get(context).
                          AppCubit.get(context)
                              .fillUp(AppCubit.get(context).levelsPassed);
                          // if (AppCubit.get(context).fill > 0) {
                          //   if (AppCubit.get(context).fill == 20) {
                          //     AppCubit.get(context).fill =
                          //         AppCubit.get(context).fill - 20;
                          //   } else {
                          //     AppCubit.get(context).fill =
                          //         AppCubit.get(context).fill - 30;
                          //   }
                          // }
                          if (kDebugMode) {
                            print(AppCubit.get(context).level);
                            print(AppCubit.get(context).fill);
                          }
                          if (AppCubit.get(context).getLevel(
                                      AppCubit.get(context).levelsPassed) ==
                                  8 ||
                              AppCubit.get(context).fill == 0) {
                            AppCubit.get(context).levelsPassed =
                                AppCubit.get(context).levelsPassed + 1;
                            log('${AppCubit.get(context).finished(AppCubit.get(context).levelsPassed)}',
                                name: 'next level opacity before');
                            AppCubit.get(context).finishLevel(
                                AppCubit.get(context).levelsPassed);
                            log('${AppCubit.get(context).finished(AppCubit.get(context).levelsPassed)}',
                                name: 'next level opacity after');
                            // AppCubit.get(context)
                            //     .doneLevel(AppCubit.get(context).levelsPassed - 1);
                            // AppCubit.get(context).level = 1;
                            // AppCubit.get(context).opacity = 0.5;
                            // AppCubit.get(context).fill=200;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Levels(level: 1),
                                ));
                          } else {
                            log('${levelIndex}',
                                name: 'before navigation');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MapLevel(
                                  level: AppCubit.get(context).getLevel(
                                      AppCubit.get(context).levelsPassed),
                                  levelIndex: levelIndex,
                                ),
                              ),
                            );
                          }
                          AppCubit.get(context).remove = ' ';
                          AppCubit.get(context).mistakes = 0;
                        },
                        'التالي',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

storySuccessDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: SvgPicture.asset(
                              'assets/Reload 2.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          CircleAvatar(
                            radius: 25,
                            child: SvgPicture.asset('assets/levelButton.svg'),
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/Gift.svg'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: onBoardingButton(
                        color: ColorMain.colorBlue,
                        context,
                        () {
                          Navigator.pushNamed(context, 'Story');
                        },
                        'التالي',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

//////////////////

Widget onboarding(OnBoardingModel model) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/cloud.svg"),
          SvgPicture.asset("assets/cloud.svg"),
        ],
      ),
      // Lottie.asset("assets/lottie/Snoop.json",height: 100),
      SvgPicture.asset(model.image),
      // const SizedBox(height:70,),
    ],
  );
}

Widget onBoardingButton(
  BuildContext context,
  Function() function,
  String title, {
  Color color = ColorMain.colorOrangeConst,
}) {
  return Container(
    // margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/8 ,),
    width: 200,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(20),
    ),
    child: MaterialButton(
      onPressed: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "Blabeloo",
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            // const SizedBox(width:20),
            const Icon(
              My_Icons.arrows,
              color: Colors.white,
              weight: 50,
              size: 20,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget lockedLevel() => CircleAvatar(
      radius: 40,
      backgroundColor: ColorMain.colorOrange,
      child: const Icon(
        My_Icons.lock,
        size: 40,
        color: Colors.white,
      ),
    );

Widget currentLevel(String letter) => CircleAvatar(
      radius: 40,
      backgroundColor: ColorMain.colorOrange,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: ColorMain.color0O,
        child: Stack(
          children: [
            Center(
              child: Text(
                letter,
                style: storyExTextStyle().copyWith(
                  fontSize: 50,
                  color: ColorMain.colorLBlue,
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(40, -40),
              child: SvgPicture.asset(
                'assets/Flag.svg',
                // height: 100,
              ),
            ),
          ],
        ),
      ),
    );

Widget finishedLevel() => CircleAvatar(
      radius: 40,
      backgroundColor: ColorMain.colorOrange,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: ColorMain.color0O,
        child: SvgPicture.asset(
          'assets/Flag.svg',
          height: 100,
        ),
      ),
    );

class MapLevels extends StatelessWidget {
  final int level;
  final int levelIndex;

  const MapLevels({super.key, required this.level, required this.levelIndex});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return FutureBuilder(
            future: AppCubit.get(context).getLetter(),
            builder: (context, snapshot) {
              log('${AppCubit.get(context).getIndex(levelIndex)}',
                  name: 'map Level level index');
              log('${AppCubit.get(context).getIndex(level)}',
                  name: 'map Level level');
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 7 - level) {
                    return Transform.translate(
                      offset: Offset(index % 2 == 0 ? -50 : 50, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: InkWell(
                          onTap: () {
                            switch (index) {
                              case 6:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SoundLevel(index: levelIndex),
                                  ),
                                );
                              case 5:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FathaLevel(index: levelIndex),
                                  ),
                                );
                              case 4:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ThmahLevel(index: levelIndex),
                                  ),
                                );
                              case 3:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        KasrahLevel(index: levelIndex),
                                  ),
                                );
                              case 2:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SoundLevel(index: levelIndex),
                                  ),
                                );
                              case 1:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ThmahLevel(index: levelIndex),
                                  ),
                                );
                              case 0:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        KasrahLevel(index: levelIndex),
                                  ),
                                );
                            }
                          },
                          child: currentLevel(snapshot
                                  .data?[AppCubit.get(context)
                                      .getIndex(levelIndex)]
                                  .letter ??
                              ""),
                        ),
                      ),
                    );
                  } else if (level == 8) {
                    return Transform.translate(
                      offset: Offset(index % 2 == 0 ? -50 : 50, 0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: InkWell(
                          onTap: () {
                            switch (index) {
                              case 6:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SoundLevel(index: levelIndex),
                                  ),
                                );
                              case 5:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        FathaLevel(index: levelIndex),
                                  ),
                                );
                              case 4:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ThmahLevel(index: levelIndex),
                                  ),
                                );
                              case 3:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        KasrahLevel(index: levelIndex),
                                  ),
                                );
                              case 2:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SoundLevel(index: levelIndex),
                                  ),
                                );
                              case 1:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ThmahLevel(index: levelIndex),
                                  ),
                                );
                              case 0:
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        KasrahLevel(index: levelIndex),
                                  ),
                                );
                            }
                          },
                          child: currentLevel(snapshot
                                  .data?[AppCubit.get(context)
                                      .getIndex(levelIndex)]
                                  .letter ??
                              ""),
                        ),
                      ),
                    );
                  } else {
                    if (index > 7 - level) {
                      return Transform.translate(
                        offset: Offset(index % 2 == 0 ? -50 : 50, 0),
                        child: finishedLevel(),
                      );
                    } else {
                      return Transform.translate(
                        offset: Offset(index % 2 == 0 ? -50 : 50, 0),
                        child: lockedLevel(),
                      );
                    }
                  }
                },
                itemCount: 7,
              );
            });
      },
    );
  }
}

Widget lettersOnTop(
  BuildContext context, {
  double fill = 200,
  dx = 0.0,
  dy = 0.0,
  opacity = 0.5,
  h = 0.0,
  w = 0.0,
  required String character,
  required String letter,
  required int index,
  required int value,
}) {
  AppCubit.get(context).initIndex(index, value);
  return Opacity(
    opacity: opacity,
    child: InkWell(
      onTap: () {
        if (opacity == 1.0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapLevel(
                  level: AppCubit.get(context).mapLevel[index],
                  levelIndex: AppCubit.get(context).levelIndex[index]),
            ),
          );
        }
      },
      child: Container(
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
              margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
              height: fill,
              width: 150,
              decoration: BoxDecoration(
                color: ColorMain.colorMain,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Transform.translate(
              offset: Offset(dx, dy),
              child: SvgPicture.asset(
                'assets/characters/$character.svg',
              ),
            ),
            Center(
              child: Transform.translate(
                offset: Offset(w, h),
                child: Text(
                  letter,
                  style: TextStyle(
                    fontFamily: 'Blabeloo',
                    fontSize: 100,
                    color: ColorMain.colorLBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget lettersBottom(
  BuildContext context, {
  double fill = 200,
  dx = 0.0,
  dy = 0.0,
  opacity = 0.5,
  h = 0.0,
  w = 0.0,
  required String character,
  required String letter,
  required int index,
  required int value,
}) {
  AppCubit.get(context).initIndex(index, value);

  return Opacity(
    opacity: opacity,
    child: InkWell(
      onTap: () {
        if (opacity == 1.0) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MapLevel(
                  level: AppCubit.get(context).mapLevel[index],
                  levelIndex: AppCubit.get(context).levelIndex[index]),
            ),
          );
        }
      },
      child: Container(
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
              margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
              height: fill,
              width: 150,
              decoration: BoxDecoration(
                color: ColorMain.colorMain,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Center(
              child: Transform.translate(
                offset: Offset(w, h),
                child: Text(
                  letter,
                  style: TextStyle(
                    fontFamily: 'Blabeloo',
                    fontSize: 100,
                    color: ColorMain.colorLBlue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(dx, dy),
              child: SvgPicture.asset(
                'assets/characters/$character.svg',
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget lettersBehind(
  BuildContext context, {
  double fill = 200,
  dx = 0.0,
  dy = 0.0,
  opacity = 0.5,
  h = 0.0,
  w = 0.0,
  required String character,
  required String letter,
  required int index,
  required int value,
}) {
  AppCubit.get(context).initIndex(index, value);
  return InkWell(
    onTap: () {
      if (opacity == 1.0) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MapLevel(
                level: AppCubit.get(context).mapLevel[index],
                levelIndex: AppCubit.get(context).levelIndex[index]),
          ),
        );
      }
    },
    child: Opacity(
      opacity: opacity,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(dx, dy),
            child: SvgPicture.asset(
              'assets/characters/$character.svg',
            ),
          ),
          Container(
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
                  margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
                  height: fill,
                  width: 150,
                  decoration: BoxDecoration(
                    color: ColorMain.colorMain,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Center(
                  child: Transform.translate(
                    offset: Offset(w, h),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontFamily: 'Blabeloo',
                        fontSize: 100,
                        color: ColorMain.colorLBlue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget specialLevel({
  required String character1,
  required String letters,
  required String character2,
  dx1 = 0.0,
  dy1 = 0.0,
  dx2 = 0.0,
  dy2 = 0.0,
  dx3 = 0.0,
  dy3 = 0.0,
  opacity = 0.5,
  bool size = false,
  bool flip1 = false,
  bool flip2 = false,
}) {
  return Opacity(
    opacity: opacity,
    child: Container(
      width: 330,
      height: 140,
      decoration: BoxDecoration(
        color: ColorMain.color0Orange,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: ColorMain.colorOrange,
          width: 5,
        ),
      ),
      child: OverflowBox(
        maxWidth: 410,
        minWidth: 410,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.flip(
              flipX: flip1,
              child: Transform.translate(
                offset: Offset(dx1, dy1),
                child: SvgPicture.asset(
                  'assets/characters/$character1.svg',
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(dx2, dy2),
              child: Text(
                letters,
                style: TextStyle(
                  fontFamily: 'Blabeloo',
                  fontSize: size ? 30 : 43,
                  color: ColorMain.colorLBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Transform.flip(
              flipX: flip2,
              child: Transform.translate(
                offset: Offset(dx3, dy3),
                child: SvgPicture.asset(
                  'assets/characters/$character2.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget levelSize() => const SizedBox(height: 20);

TextStyle storyTextStyle() => TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Blabeloo',
      fontSize: 19,
      height: 1.5,
      color: ColorMain.colorBlue,
    );

TextStyle storyExTextStyle() => TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: 'Blabeloo',
      fontSize: 19,
      color: Colors.blue.shade700,
    );

Widget levelRow(Widget widget1, widget2) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        widget1,
        widget2,
      ],
    );

// List<StoryModel> stories = [
//   StoryModel(
//       character: 'assets/story/Girl.svg',
//       text: '...رنب',
//       backgroundImage: 'assets/story/StoryBackground.svg',
//       textAfter: ' يعيش في بيت مريح',
//       textBefore: 'كان هناك '),
//   StoryModel(
//       character: 'assets/story/Girl2.svg',
//       text: '...لى',
//       backgroundImage: 'assets/story/StoryBackground2.svg',
//       textAfter: 'المرج ليأكل الجزر الطازج.',
//       textBefore: 'كل يوم، كان الأرنب يقفز'),
//   StoryModel(
//       character: 'assets/story/Girl3.svg',
//       text: ' ر...ى',
//       backgroundImage: 'assets/story/StoryBackground3.svg',
//       textAfter: 'الارنب تفاحة حمراء طرية. ',
//       textBefore: 'بعد ظهر أحد الأيام المشمسة، '),
//   StoryModel(
//       character: 'assets/story/Girl4.svg',
//       text: 'التف.... حة',
//       backgroundImage: 'assets/story/StoryBackground4.svg',
//       textAfter: ' ',
//       textBefore: 'قفز الارنب وأخذ قضمة كبيرة من '),
//   StoryModel(
//       character: 'assets/story/Girl5.svg',
//       text: 'ال...نتهاء',
//       backgroundImage: 'assets/story/StoryBackground5.svg',
//       textAfter:
//           ' من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',
//       textBefore: 'بعد '),
// ];

Widget storyTemplate(
  BuildContext context,
  List<Map<String, dynamic>?> story,
  int index,
  int selectedIndex,
  PageController storyController, {
  Color color = ColorMain.colorOrangeConst,
}) {
  var word = AppCubit.get(context).buildList(
    story[index]?['word'],
    story[index]?['missingLetter'],
  );
  return Stack(
    children: [
      SvgPicture.network(
        story[index]?['backgroundImage'],
        // 'assets/story/StoryBackground.svg',
        fit: BoxFit.cover,
      ),
      Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 30.0,
            ),
            child: CircleAvatar(
              backgroundColor: ColorMain.colorOrange,
              radius: 30,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
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
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              color: ColorMain.colorMain,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Transform.translate(
                  offset: const Offset(0.0, -20.0),
                  child: SvgPicture.network(
                    story[index]?['character'],
                    // 'assets/story/Girl.svg',
                  ),
                ),
                Container(
                  // color:Colors.red,
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 4,
                  padding: const EdgeInsets.only(
                    right: 30.0,
                    top: 10.0,
                  ),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      children: [
                        Text(
                          "${story[index]?['textBefore']} ",
                          // 'بعد ',
                          style: storyTextStyle(),
                        ),
                        InkWell(
                          onTap: () {
                            if (kDebugMode) {
                              print('hello');
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    AppCubit.get(context).remove = ' ';
                                    AppCubit.get(context).mistakes = 0;
                                    return SimpleDialog(
                                      alignment: Alignment.center,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // Text('Hello World'),
                                            Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: DialogMissingLetter(
                                                lastPage:
                                                    story.length.toDouble(),
                                                storyController:
                                                    storyController,
                                                color: ColorMain.colorBlue,
                                                items: story[index]
                                                    ?['randomLetters'],
                                                letters: word,
                                                selectedIndex: selectedIndex,
                                                missingLetter: story[index]
                                                    ?['missingLetter'],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  });
                            }
                          },
                          child: Container(
                            color: ColorMain.colorBlue.withOpacity(0.5),
                            child: Text(
                              " ${story[index]?['text']} ",
                              style: storyExTextStyle(),
                            ),
                          ),
                        ),
                        Text(
                          " ${story[index]?['textAfter']}",
                          // ' من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',
                          style: storyTextStyle(),
                        ),
                      ],
                    ),
                    // RichText(text:
                    // TextSpan(
                    //    children: [
                    //      TextSpan(text: 'بعد ',style:storyTextStyle(),),
                    //      TextSpan(text: 'ال نتهاء',style:storyExTextStyle(),),
                    //      TextSpan(text: ' من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',style:storyTextStyle()),
                    //    ],
                    // ),
                    // ),

                    // Text('بعد ال...نتهاء من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',textAlign: TextAlign.start,style: TextStyle(
                    //   fontSize:20,
                    //   fontWeight: FontWeight.bold,
                    //   color:ColorMain.colorBlue,
                    // ),),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

// Widget levelTemplate({required Future<List<Levels>?>? future,required int levelIndex,required String levelType,required Widget widget}){
//   return FutureBuilder(
//     future: future,
//     builder: (context, snapshot) {
//       if(snapshot.connectionState== ConnectionState.done){
//         if(snapshot.hasData){
//           Levels? level = snapshot.data?[0];
//           var soundLevel = level?.firstLevel?[levelType];
//           return Padding(
//             padding: const EdgeInsets.only(top: 0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 30.0,
//                     left: 20.0,
//                     right: 20.0,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: ColorMain.colorOrange,
//                         radius: 30,
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           icon: const Padding(
//                             padding: EdgeInsets.only(right: 10.0),
//                             child: Icon(
//                               My_Icons.buttonarrowleft,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       progras(width: 60),
//                       CircleAvatar(
//                         backgroundColor: ColorMain.colorOrange,
//                         radius: 30,
//                         child: Padding(
//                           padding: const EdgeInsets.only(right: 10.0),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: const Icon(
//                               My_Icons.buttonarrowright,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SvgPicture.network(
//                   soundLevel['image'],
//                   height: 350,
//                 ),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),
//                 GestureDetector(
//                   child: Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             left: 60.0, bottom: 10.0),
//                         child: Text(
//                           '$selectedIndex',
//                           style: TextStyle(
//                               fontSize: 35,
//                               fontWeight: FontWeight.w100,
//                               fontFamily: 'Blabeloo',
//                               color: colorprogres1,
//                               decorationColor: taxtcolor),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 10.0),
//                         child: SvgPicture.asset(
//                           "assets/microphone.svg",
//                         ),
//                       ),
//                     ],
//                   ),
//                   onTap: () {
//                     setState(() {
//                       if (selectedIndex > 0) {
//                         selectedIndex--;
//                         player.play(UrlSource(soundLevel['audio'])).then((on) {
//                           if (kDebugMode) {
//                             print('good');
//                           }
//                         }).catchError((onError){
//                           if (kDebugMode) {
//                             print('bad $onError');
//                           }
//                         });
//                       }
//                     });
//
//                     print(selectedIndex);
//                   },
//                 ),
//                 // SizedBox(
//                 //   height: 100,
//                 // ),
//                 defultButton(
//                     pagename: () {
//                       Navigator.pushNamed(context, 'Drawing');
//                     },
//                     text: "التالي"),
//               ],
//             ),
//           );
//         }
//         else if(snapshot.hasError){
//           return Center(child: Text(
//             " ${snapshot.error.toString()} =======",),);
//         }
//         else{
//           return const Center(child: Text("Error",),);
//
//         }
//       }else {
//         return  const Center(child: CircularProgressIndicator(),);
//       }
//     },);
// }

// class SoundLevel extends StatefulWidget {
//   final int level;
//
//   const SoundLevel({super.key, required this.level});
//
//   @override
//   State<SoundLevel> createState() => _SoundLevelState();
// }
//
// class _SoundLevelState extends State<SoundLevel> {
//   final player = AudioPlayer();
//
//   int selectedIndex = 3;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return SafeArea(
//           child: Scaffold(
//             body: Center(
//               child: Container(
//                 width: double.infinity,
//                 color: colormain,
//                 child: FutureBuilder(
//                   future: AppCubit.get(context).getLetter(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       if (snapshot.hasData) {
//                         Levels? level = snapshot.data?[widget.level];
//                         var soundLevel = level?.firstLevel?['soundLevel'];
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Expanded(
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor: ColorMain.colorOrange,
//                                       radius: 30,
//                                       child: IconButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         icon: const Padding(
//                                           padding: EdgeInsets.only(right: 10.0),
//                                           child: Icon(
//                                             My_Icons.buttonarrowleft,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                     progras(width: 60),
//                                     CircleAvatar(
//                                       backgroundColor: ColorMain.colorOrange,
//                                       radius: 30,
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(right: 10.0),
//                                         child: IconButton(
//                                           onPressed: () {},
//                                           icon: const Icon(
//                                             My_Icons.buttonarrowright,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Center(
//                                 child: SvgPicture.network(
//                                   soundLevel['image'],
//                                   placeholderBuilder: (context) => Text('الحرف',
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .headlineLarge),
//                                   height: 350,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 child: Stack(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 60.0, bottom: 10.0),
//                                       child: Text(
//                                         '$selectedIndex',
//                                         style: TextStyle(
//                                             fontSize: 35,
//                                             fontWeight: FontWeight.w100,
//                                             fontFamily: 'Blabeloo',
//                                             color: colorprogres1,
//                                             decorationColor: taxtcolor),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 10.0),
//                                       child: SvgPicture.asset(
//                                         "assets/microphone.svg",
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 onTap: () {
//                                   setState(() {
//                                     if (selectedIndex > 0) {
//                                       selectedIndex--;
//                                       player
//                                           .play(UrlSource(soundLevel['audio']))
//                                           .then((on) {
//                                         if (kDebugMode) {
//                                           print('good');
//                                         }
//                                       }).catchError((onError) {
//                                         if (kDebugMode) {
//                                           print('bad $onError');
//                                         }
//                                       });
//                                     }
//                                   });
//
//                                   print(selectedIndex);
//                                 },
//                               ),
//                               defultButton(
//                                   pagename: () {
//                                     Navigator.pushNamed(
//                                       context,
//                                       'Drawing',
//                                     );
//                                   },
//                                   text: "التالي"),
//                             ],
//                           ),
//                         );
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Text(
//                             " ${snapshot.error.toString()} =======",
//                           ),
//                         );
//                       } else {
//                         return const Center(
//                           child: Text(
//                             "Error",
//                           ),
//                         );
//                       }
//                     } else {
//                       return const Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// Widget futureCall(BuildContext context,
//         {required int index, required Widget widget}) =>
//     FutureBuilder(
//       future: AppCubit.get(context).getLetter(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasData) {
//             Levels? level = snapshot.data?[index];
//             var soundLevel = level?.firstLevel?['soundLevel'];
//             return widget;
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 " ${snapshot.error.toString()} =======",
//               ),
//             );
//           } else {
//             return const Center(
//               child: Text(
//                 "Error",
//               ),
//             );
//           }
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       },
//     );

class Mic extends StatefulWidget {
  Mic(
      {super.key,
      required this.index,
      required this.soundLevel,
      required this.levelIndex});

  final int levelIndex;
  late int index;
  late Map<String, dynamic> soundLevel;

  @override
  State<Mic> createState() => _MicState();
}

class _MicState extends State<Mic> {
  final player = AudioPlayer();
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60.0, bottom: 10.0),
                child: Text(
                  '${widget.index}',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Blabeloo',
                    color: colorprogres1,
                    decorationColor: taxtcolor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  "assets/microphone.svg",
                ),
              ),
            ],
          ),
          onTap: () {
            setState(() {
              if (widget.index > 0) {
                player
                    .play(
                  UrlSource(
                    widget.soundLevel['audio'],
                  ),
                )
                    .then(
                  (on) {
                    widget.index = widget.index - 1;
                    log('good', name: 'good response');
                    log('${widget.index}');
                  },
                ).catchError(
                  (onError) {
                    log('bad ============== ===== $onError', name: 'error');
                  },
                );
              } else {
                enabled = true;
              }
            });
          },
        ),
        defultButton(
          enabled: enabled,
          pagename: () {
            if (enabled) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Draw(
                            index: widget.levelIndex,
                          )));
            } else {
              log('not yet');
            }
          },
          text: "التالي",
        ),
      ],
    );
  }
}

class MissingLetter extends StatefulWidget {
  MissingLetter({
    super.key,
    required this.items,
    required this.letters,
    required this.selectedIndex,
    required this.levelIndex,
    required this.missingLetter,
    this.color = ColorMain.colorOrangeConst,
    this.dialog = false,
  });

  Color color;
  bool dialog;
  final List items;
  final List letters;
  final String missingLetter;
  late int selectedIndex;
  final int levelIndex;

  @override
  State<MissingLetter> createState() => _MissingLetterState();
}

class _MissingLetterState extends State<MissingLetter> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List<Widget>.generate(widget.letters.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(right: i == 0 ? 0 : 20.0),
                  child: Text(
                    widget.letters[i] == '    '
                        ? AppCubit.get(context).remove
                        : widget.letters[i],
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: widget.color,
                      decorationColor: colorprogres1,
                      fontSize: 40,
                    ),
                  ),
                );
              })
              // [
              //   Text(
              //     "ب",
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: iconcolor,
              //       decorationColor: colorprogres1,
              //       fontSize: 40,
              //     ),
              //   ),
              //   const SizedBox(
              //     width: 15,
              //   ),
              //   Text(
              //     "ن",
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: iconcolor,
              //       decorationColor: colorprogres1,
              //       fontSize: 40,
              //     ),
              //   ),
              //   const SizedBox(
              //     width: 15,
              //   ),
              //   Text(
              //     "ر",
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: iconcolor,
              //       decorationColor: colorprogres1,
              //       fontSize: 40,
              //     ),
              //   ),
              //   const SizedBox(
              //     width: 15,
              //   ),
              //   selectedIndex != -1
              //       ? Text(' ${items[selectedIndex]}',
              //       style: TextStyle(
              //         decoration: TextDecoration.underline,
              //         color: iconcolor,
              //         decorationColor: colorprogres1,
              //         fontSize: 40,
              //       ))
              //       : Container(),
              // ],
              ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 252,
          height: 130,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedIndex = index;
                    AppCubit.get(context).remove = widget.items[index];
                    if (AppCubit.get(context).remove == widget.missingLetter) {
                      enabled = true;
                      successDialog(context,widget.levelIndex);
                    } else {
                      AppCubit.get(context).addMistakes(context);
                      log('${AppCubit.get(context).mistakes}',
                          name: 'mistakes');
                      log('Wrong Choice', name: 'Choose Letter');
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.selectedIndex == index
                        ? widget.color
                        : Colors.white,
                  ),
                  width: 10,
                  height: 19,
                  child: Center(
                    child: Text(
                      widget.items[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: widget.selectedIndex == index
                            ? Colors.white
                            : colorprogres1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: defultButton(
            color: widget.color,
            enabled: enabled,
            pagename: () {
              if (enabled) {
                AppCubit.get(context).levelUp(widget.levelIndex);
                // if (AppCubit.get(context).level <= 7) {
                //   AppCubit.get(context).level = AppCubit.get(context).level + 1;
                // }
                // AppCubit.get(context).
                AppCubit.get(context)
                    .fillUp(AppCubit.get(context).levelsPassed);
                // if (AppCubit.get(context).fill > 0) {
                //   if (AppCubit.get(context).fill == 20) {
                //     AppCubit.get(context).fill =
                //         AppCubit.get(context).fill - 20;
                //   } else {
                //     AppCubit.get(context).fill =
                //         AppCubit.get(context).fill - 30;
                //   }
                // }
                if (kDebugMode) {
                  print(AppCubit.get(context).level);
                  print(AppCubit.get(context).fill);
                }
                if (AppCubit.get(context)
                            .getLevel(AppCubit.get(context).levelsPassed) ==
                        8 ||
                    AppCubit.get(context).fill == 0) {
                  AppCubit.get(context).levelsPassed =
                      AppCubit.get(context).levelsPassed + 1;
                  log('${AppCubit.get(context).finished(AppCubit.get(context).levelsPassed)}',
                      name: 'next level opacity before');
                  AppCubit.get(context)
                      .finishLevel(AppCubit.get(context).levelsPassed);
                  log('${AppCubit.get(context).finished(AppCubit.get(context).levelsPassed)}',
                      name: 'next level opacity after');

                  // AppCubit.get(context)
                  //     .doneLevel(AppCubit.get(context).levelsPassed - 1);
                  // AppCubit.get(context).level = 1;
                  // AppCubit.get(context).opacity = 0.5;
                  // AppCubit.get(context).fill=200;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Levels(level: 1),
                      ));
                } else {
                  log('${widget.levelIndex}', name: 'before navigation');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapLevel(
                              level: AppCubit.get(context)
                                  .getLevel(AppCubit.get(context).levelsPassed),
                              levelIndex: widget.levelIndex)));
                }
                AppCubit.get(context).remove = ' ';
                AppCubit.get(context).mistakes = 0;
              }
            },
            text: "التالي",
          ),
        ),
      ],
    );
  }
}

class DialogMissingLetter extends StatefulWidget {
  DialogMissingLetter({
    super.key,
    required this.items,
    required this.letters,
    required this.selectedIndex,
    required this.missingLetter,
    required this.storyController,
    required this.lastPage,
    this.color = ColorMain.colorOrangeConst,
    this.dialog = false,
  });

  Color color;
  double lastPage;
  bool dialog;
  final List items;
  final PageController storyController;
  final List letters;
  final String missingLetter;
  late int selectedIndex;

  @override
  State<DialogMissingLetter> createState() => _DialogMissingLetterState();
}

class _DialogMissingLetterState extends State<DialogMissingLetter> {
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: List<Widget>.generate(widget.letters.length, (i) {
                return Padding(
                  padding: EdgeInsets.only(right: i == 0 ? 0 : 20.0),
                  child: Text(
                    widget.letters[i] == '    '
                        ? AppCubit.get(context).remove
                        : widget.letters[i],
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: widget.color,
                      decorationColor: colorprogres1,
                      fontSize: 40,
                    ),
                  ),
                );
              })
              // [
              //   Text(
              //     "ب",
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: iconcolor,
              //       decorationColor: colorprogres1,
              //       fontSize: 40,
              //     ),
              //   ),
              //   const SizedBox(
              //     width: 15,
              //   ),
              //   Text(
              //     "ن",
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: iconcolor,
              //       decorationColor: colorprogres1,
              //       fontSize: 40,
              //     ),
              //   ),
              //   const SizedBox(
              //     width: 15,
              //   ),
              //   Text(
              //     "ر",
              //     style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       color: iconcolor,
              //       decorationColor: colorprogres1,
              //       fontSize: 40,
              //     ),
              //   ),
              //   const SizedBox(
              //     width: 15,
              //   ),
              //   selectedIndex != -1
              //       ? Text(' ${items[selectedIndex]}',
              //       style: TextStyle(
              //         decoration: TextDecoration.underline,
              //         color: iconcolor,
              //         decorationColor: colorprogres1,
              //         fontSize: 40,
              //       ))
              //       : Container(),
              // ],
              ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 252,
          height: 130,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selectedIndex = index;
                    AppCubit.get(context).remove = widget.items[index];
                    if (AppCubit.get(context).remove == widget.missingLetter) {
                      enabled = true;
                    } else {
                      AppCubit.get(context).addMistakes(context);
                      log('${AppCubit.get(context).mistakes}',
                          name: 'mistakes');
                      log('Wrong Choice', name: 'Choose Letter');
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: widget.selectedIndex == index
                        ? widget.color
                        : Colors.white,
                  ),
                  width: 10,
                  height: 19,
                  child: Center(
                    child: Text(
                      widget.items[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: widget.selectedIndex == index
                            ? Colors.white
                            : colorprogres1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: defultButton(
            color: widget.color,
            enabled: enabled,
            pagename: () {
              log("${widget.lastPage - 1.0}", name: 'page index');
              if (widget.storyController.page == widget.lastPage - 1.0) {
                Navigator.pop(context);
                storySuccessDialog(context);
              } else {
                widget.storyController.nextPage(
                    duration: const Duration(seconds: 1), curve: Curves.linear);
                Navigator.pop(context);
              }
            },
            text: "التالي",
          ),
        ),
      ],
    );
  }
}

Widget topRow(String routeName) => BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: ColorMain.colorOrange,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
                progras(width: 160),
                state is! AppMistakeAddedState
                    ? Container()
                    : CircleAvatar(
                        backgroundColor: ColorMain.colorOrange,
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, routeName);
                            },
                            icon: const Icon(
                              My_Icons.buttonarrowright,
                              color: Colors.white,
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
