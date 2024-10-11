import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wist/my__icons_icons.dart';
// import 'package:wist/shared/components/components.dart';
import '../models/levels.dart';
import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../shard/styles/color.dart';
import 'drawingPage.dart';

class SoundLevel extends StatelessWidget {
  final int index;
  const SoundLevel({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    log('${index}',name:'soundLevel');
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              color: colormain,
              child: FutureBuilder(
                future: AppCubit.get(context).getLetter(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      Levels? level =
                          snapshot.data?[AppCubit.get(context).getIndex(index)];
                      var soundLevel = level?.firstLevel?['soundLevel'];
                       int selectedIndex = soundLevel['repeat']??3;
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
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
                              progras(width: 60),
                              CircleAvatar(
                                backgroundColor: ColorMain.colorOrange,
                                radius: 30,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.push(context,MaterialPageRoute(builder: (context)=> Draw(index: index,)));
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
                          Text(level?.letter??'',style:Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 250,
                            fontFamily:'Arfont',
                            color:ColorMain.colorLBlue,
                          ),),
                          Mic(
                            levelIndex: index,
                            index: selectedIndex,
                            soundLevel: soundLevel,
                          ),
                          // GestureDetector(
                          //   child: Stack(
                          //     children: [
                          //       Padding(
                          //         padding: const EdgeInsets.only(
                          //             left: 60.0, bottom: 10.0),
                          //         child: Text(
                          //           '$selectedIndex',
                          //           style: TextStyle(
                          //               fontSize: 35,
                          //               fontWeight: FontWeight.w100,
                          //               fontFamily: 'Blabeloo',
                          //               color: colorprogres1,
                          //               decorationColor: taxtcolor),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.only(top: 10.0),
                          //         child: SvgPicture.asset(
                          //           "assets/microphone.svg",
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   onTap: () {
                          //     print('$selectedIndex ====================');
                          //     setState(() {
                          //       if (selectedIndex > 0) {
                          //         AppCubit.get(context).selectedIndex = AppCubit.get(context).selectedIndex - 1;
                          //         player.play(UrlSource(soundLevel['audio'])).then((on) {
                          //           if (kDebugMode) {
                          //             print('good');
                          //           }
                          //         }).catchError((onError){
                          //           if (kDebugMode) {
                          //             print('bad $onError');
                          //           }
                          //         });
                          //       }
                          //     });
                          //     print('$selectedIndex ====================');
                          //     print('${soundLevel['repeat']} ====================');
                          //     print('${AppCubit.get(context).selectedIndex} ====================');
                          //   },
                          // ),

                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          " ${snapshot.error.toString()} =======",
                        ),
                      );
                    }
                    else {
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
        );
      },
    );
  }
}
