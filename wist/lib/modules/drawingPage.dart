import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wist/my__icons_icons.dart';
import '../models/levels.dart';
import 'test/sketch.dart';

import '../shard/components/components.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';
import '../shard/styles/color.dart';
import 'chooseLetter.dart';
import 'test/drawing.dart';

class Draw extends StatelessWidget {
  final int index;
  const Draw({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppCubit.get(context).getLetter(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            Levels? level = snapshot
                .data?[index];
            var draw =
            level?.firstLevel?['drawingLevel'];
            return DrawingPage(url:draw['correctDrawing'], index: index,);
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
    );
  }
}

class DrawingPage extends HookWidget {
  final int index;
  final String url;
  const DrawingPage( {required this.index, required this.url,super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<Sketch?> currentSketch = useState(null);
    ValueNotifier<List<Sketch>> allSketches = useState([]);
    log('${index}',name:'drawingLevel');

    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: colormain,
            body: Column(
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
                    progras(width: 120),
                    CircleAvatar(
                      backgroundColor: ColorMain.colorOrange,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'chooseLetter');
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
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(url,),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  height: 450,
                  // width: 50,
                  child: DrawingApp(
                    allSketches: allSketches,
                    currentSketch: currentSketch,
                  ),
                ),
                defultButton(
                    pagename: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  ChooseLetter(index: index,)));
                    },
                    text: "التالي"),
              ],
            ),
          ),
        );
      },
    );
  }
}
