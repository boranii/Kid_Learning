// import 'dart:developer';
// import 'package:wist/modules/Map_level.dart';
import 'dart:developer';
import "package:flutter/foundation.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../models/levels.dart';
import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../shard/styles/color.dart';

class ChooseLetter extends StatefulWidget {
  final int index;
  const ChooseLetter({super.key, required this.index});

  @override
  ChooseLetterState createState() => ChooseLetterState();
}

class ChooseLetterState extends State<ChooseLetter> {
  int selectedIndex = -1;

  List<String> items = [
    'أ',
    'ب',
    'ت',
    'ث',
    'ح',
    'خ',
    'ج',
    'د',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        log('${widget.index}',name:'chooseletterLevel');
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: colormain,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: FutureBuilder(
                    future: AppCubit.get(context).getLetter(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          Levels? level = snapshot
                              .data?[widget.index];
                          var chooseLetterLevel =
                              level?.firstLevel?['missingLetter'];
                          List letters = AppCubit.get(context).buildList(
                            chooseLetterLevel['word'],
                            chooseLetterLevel['missingLetter'],
                          );
                          List items = chooseLetterLevel['randomLetters'];

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              topRow('Map'),
                              // Directionality(
                              //   textDirection: TextDirection.ltr,
                              //   child: Padding(
                              //     padding: const EdgeInsets.only(
                              //       top: 30.0,
                              //       left: 20.0,
                              //       right: 20.0,
                              //     ),
                              //     child: Row(
                              //       mainAxisAlignment:
                              //           MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         CircleAvatar(
                              //           backgroundColor: ColorMain.colorOrange,
                              //           radius: 30,
                              //           child: IconButton(
                              //             onPressed: () {
                              //               Navigator.of(context).pop();
                              //             },
                              //             icon: const Padding(
                              //               padding:
                              //                   EdgeInsets.only(right: 10.0),
                              //               child: Icon(
                              //                 My_Icons.buttonarrowleft,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //         progras(width: 160),
                              //         state is! AppMistakeAddedState? Container():CircleAvatar(
                              //           backgroundColor: ColorMain.colorOrange,
                              //           radius: 30,
                              //           child: Padding(
                              //             padding: const EdgeInsets.only(
                              //                 right: 10.0),
                              //             child: IconButton(
                              //               onPressed: () {},
                              //               icon: const Icon(
                              //                 My_Icons.buttonarrowright,
                              //                 color: Colors.white,
                              //               ),
                              //             ),
                              //           ),
                              //         ) ,
                              //       ],
                              //     ),
                              //   ),
                              // ),
                              SvgPicture.network(
                                chooseLetterLevel['image'],
                                placeholderBuilder: (context) => Text(
                                  chooseLetterLevel['word'],
                                  style:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                              MissingLetter(
                                items: items,
                                letters: letters,
                                selectedIndex: selectedIndex,
                                missingLetter:
                                    chooseLetterLevel['missingLetter'], levelIndex: widget.index,
                              ),
                              // Container(
                              //   height: 80,
                              //   decoration: BoxDecoration(
                              //     color: Colors.white,
                              //     borderRadius: BorderRadius.circular(20),
                              //   ),
                              //   padding: const EdgeInsets.symmetric(
                              //       horizontal: 20.0),
                              //   child: Row(
                              //       mainAxisAlignment: MainAxisAlignment.center,
                              //       mainAxisSize: MainAxisSize.min,
                              //       children: List<Widget>.generate(
                              //           letters.length, (i) {
                              //         return Padding(
                              //           padding: EdgeInsets.only(
                              //               right: i == 0 ? 0 : 20.0),
                              //           child: Text(
                              //             letters[i] == '    '
                              //                 ? AppCubit.get(context).remove
                              //                 : letters[i],
                              //             style: TextStyle(
                              //               decoration:
                              //                   TextDecoration.underline,
                              //               color: iconcolor,
                              //               decorationColor: colorprogres1,
                              //               fontSize: 40,
                              //             ),
                              //           ),
                              //         );
                              //       })
                              //       // [
                              //       //   Text(
                              //       //     "ب",
                              //       //     style: TextStyle(
                              //       //       decoration: TextDecoration.underline,
                              //       //       color: iconcolor,
                              //       //       decorationColor: colorprogres1,
                              //       //       fontSize: 40,
                              //       //     ),
                              //       //   ),
                              //       //   const SizedBox(
                              //       //     width: 15,
                              //       //   ),
                              //       //   Text(
                              //       //     "ن",
                              //       //     style: TextStyle(
                              //       //       decoration: TextDecoration.underline,
                              //       //       color: iconcolor,
                              //       //       decorationColor: colorprogres1,
                              //       //       fontSize: 40,
                              //       //     ),
                              //       //   ),
                              //       //   const SizedBox(
                              //       //     width: 15,
                              //       //   ),
                              //       //   Text(
                              //       //     "ر",
                              //       //     style: TextStyle(
                              //       //       decoration: TextDecoration.underline,
                              //       //       color: iconcolor,
                              //       //       decorationColor: colorprogres1,
                              //       //       fontSize: 40,
                              //       //     ),
                              //       //   ),
                              //       //   const SizedBox(
                              //       //     width: 15,
                              //       //   ),
                              //       //   selectedIndex != -1
                              //       //       ? Text(' ${items[selectedIndex]}',
                              //       //       style: TextStyle(
                              //       //         decoration: TextDecoration.underline,
                              //       //         color: iconcolor,
                              //       //         decorationColor: colorprogres1,
                              //       //         fontSize: 40,
                              //       //       ))
                              //       //       : Container(),
                              //       // ],
                              //       ),
                              // ),
                              // SizedBox(
                              //   width: 252,
                              //   height: 110,
                              //   child: GridView.builder(
                              //     gridDelegate:
                              //         const SliverGridDelegateWithFixedCrossAxisCount(
                              //       crossAxisCount: 4,
                              //       crossAxisSpacing: 4.0,
                              //       mainAxisSpacing: 4.0,
                              //     ),
                              //     itemCount: items.length,
                              //     itemBuilder:
                              //         (BuildContext context, int index) {
                              //       return GestureDetector(
                              //         onTap: () {
                              //           setState(() {
                              //             selectedIndex = index;
                              //             AppCubit.get(context).remove =
                              //                 items[index];
                              //             if (AppCubit.get(context).remove ==
                              //                 chooseLetterLevel['missingLetter']) {
                              //               successDialog(context);
                              //             }
                              //             else{
                              //               log('Wrong Choice',name:'Choose Letter');
                              //             }
                              //           });
                              //         },
                              //         child: Container(
                              //           decoration: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(30),
                              //             color: selectedIndex == index
                              //                 ? iconcolor
                              //                 : Colors.white,
                              //           ),
                              //           width: 10,
                              //           height: 19,
                              //           child: Center(
                              //             child: Text(
                              //               items[index],
                              //               style: TextStyle(
                              //                 fontSize: 20,
                              //                 fontWeight: FontWeight.bold,
                              //                 color: selectedIndex == index
                              //                     ? Colors.white
                              //                     : colorprogres1,
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       );
                              //     },
                              //   ),
                              // ),
                              // Directionality(
                              //   textDirection: TextDirection.ltr,
                              //   child: defultButton(
                              //       pagename: () {
                              //         if (AppCubit.get(context).level <= 6) {
                              //           AppCubit.get(context).level =
                              //               AppCubit.get(context).level + 1;
                              //         }
                              //         if (AppCubit.get(context).fill > 0) {
                              //           if (AppCubit.get(context).fill == 20) {
                              //             AppCubit.get(context).fill =
                              //                 AppCubit.get(context).fill - 20;
                              //           } else {
                              //             AppCubit.get(context).fill =
                              //                 AppCubit.get(context).fill - 30;
                              //           }
                              //         }
                              //         if (kDebugMode) {
                              //           print(AppCubit.get(context).level);
                              //           print(AppCubit.get(context).fill);
                              //         }
                              //         AppCubit.get(context).finishLevel(1);
                              //         Navigator.pushNamed(context, 'Map');
                              //       },
                              //       text: "التالي",),
                              // ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              " ${snapshot.error.toString()} =======",
                            ),
                          );
                        } else {
                          return const Center(
                            child: Text(
                              "Error",
                            ),
                          );
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
