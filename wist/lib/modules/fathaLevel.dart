import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wist/modules/letterFathaLevel.dart';
import '../models/levels.dart';
import '../my__icons_icons.dart';
import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../shard/styles/color.dart';

class FathaLevel extends StatefulWidget {
  final int index;
  const FathaLevel({super.key, required this.index});

  @override
  State<FathaLevel> createState() => _FathaLevelState();
}

class _FathaLevelState extends State<FathaLevel> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child:FutureBuilder(
              future: AppCubit.get(context).getLetter(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    Levels? level = snapshot
                        .data?[AppCubit.get(context).levelsPassed];
                    var intro =
                    level?.secondLevel?['intro'];
                    final player = AudioPlayer();
                    player.play(AssetSource('a.mp3')).then((g){
                      log('good',name:'ftha inro');
                    });
                    return  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, top: 10, right: 0, bottom: 0),
                              child: Container(
                                width: 57,
                                height: 57,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.0),
                                    color: iconcolor),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      My_Icons.buttonarrowleft,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, top: 10, right: 10, bottom: 0),
                              child: Container(
                                width: 57,
                                height: 57,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.0),
                                  color: iconcolor,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    My_Icons.buttonarrowright,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 30,
                        // ),
                        progras(width: 54),
                        // SizedBox(
                        //   height: 50,
                        // ),
                        Container(
                          width: 280,
                          height: 255,
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            "assets/1.svg",
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: SvgPicture.asset(
                            "assets/11.svg",
                          ),
                        ),
                        // SizedBox(
                        //   height: 0,
                        // ),
                        defultButton(
                          pagename: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LetterFathaLevel(index: widget.index),),);
                          },
                          text: "التالي",
                        ),
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
        );
      },
    );
  }
}
