import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wist/shard/cubit/states.dart';
import '../../models/levels.dart';
import '../../models/story.dart';
import '../styles/color.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<bool> itemCheckedStates = List.filled(35, false);
  List<double> levelOpacity = List.filled(35, 0.5);
  List<double> levelFill = List.filled(35, 200);
  List<int> mapLevel = List.filled(35, 1);
  List<int> levelIndex = List.filled(35, 0);

  void finishLevel(int index) {
    if (kDebugMode) {
      print(levelOpacity[index]);
      print('--------------');
    }
    levelOpacity[index] = 1.0;
    if (kDebugMode) {
      print(levelOpacity[index]);
    }
  }

  void doneLevel(int index) {
    if (kDebugMode) {
      print(levelOpacity[index]);
      print('--------------');
    }
    levelOpacity[index] = 0.5;
    if (kDebugMode) {
      print(levelOpacity[index]);
    }
  }

  void fillUp(int index) {
    if (kDebugMode) {
      print(levelOpacity[index]);
      print('--------------');
    }
    if (levelFill[index] > 0) {
      if (levelFill[index] == 20) {
        levelFill[index] = levelFill[index] - 20;
      } else {
        levelFill[index] = levelFill[index] - 30;
      }
    }

    if (kDebugMode) {
      print(levelOpacity[index]);
    }
  }

  void levelUp(int index) {
    log('${mapLevel[index]}',name:'levelup function outside');

    if (mapLevel[index] <= 7) {
      mapLevel[index] = mapLevel[index] + 1;
      log('${mapLevel[index]}',name:'levelup function inside');

    }
    log('${mapLevel[index]}',name:'levelup function after');

  }

  void initIndex(int index,int level) {
      levelIndex[index] = level;
  }

  void toggleItemChecked(int index, bool? newBool) {
    itemCheckedStates[index] = newBool ?? false;
    emit(AppSuccessState()); // Emit new state
  }

  bool isChecked(int index) => itemCheckedStates[index];

  double finished(int index) => levelOpacity[index];

  double getFill(int index) => levelFill[index];

  int getLevel(int index) => mapLevel[index];

  int getIndex(int index) => levelIndex[index];

  Widget storyyy({
    required int index,
    Function(bool?)? pagname,
    required Function() page,
    required String image,
    required String text,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorMain.color0Orange, width: 4),
          borderRadius: BorderRadius.circular(15.0),
          color: color0Orange,
        ),
        width: 343,
        height: 95,
        child: GestureDetector(
          onTap: () {
            toggleItemChecked(index, true);
            page();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 4.0,
                    color:
                        isChecked(index) ? chekecolor2 : ColorMain.color0Orange,
                  ),
                  color: chekecolor,
                ),
                child: Transform.scale(
                  scale: 2.5,
                  child: Checkbox(
                      value: isChecked(index),
                      checkColor: chekecolor2,
                      side: BorderSide.none,
                      shape: const CircleBorder(),
                      onChanged: (newBool) {}),
                ),
              ),
              SizedBox(
                height: 90,
                width: 80,
                child: Transform.translate(
                  offset: const Offset(0, 5),
                  child: SvgPicture.asset(
                    image,
                  ),
                ),
              ),
              // Container(
              //   height: 150,
              //   width: 73,
              //   child: OverflowBox(
              //     maxHeight: 400,
              //     maxWidth: 400,
              //     minWidth: 50,
              //     alignment: Alignment.bottomRight,
              //     child: SvgPicture.asset(
              //       image,
              //     ),
              //   ),
              // ),
// SizedBox(width: 100,),
              Text(
                text,
                style: TextStyle(
                  color: taxtcolor,
                  fontSize: 20,
                  fontFamily: "Blabeloo",
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      );

  Widget story2({
    required int index,
    Function(bool?)? pagname,
    required Function() page,
    required String image,
    required String image2,
    required String image3,
    required String image4,
    required String text,
  }) =>
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: ColorMain.color0Orange, width: 4),
          borderRadius: BorderRadius.circular(15.0),
          color: color0Orange,
        ),
        width: 343,
        height: 143,
        child: GestureDetector(
          onTap: () {
            toggleItemChecked(index, true);
            page();
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height: 5,),
                Text(
                  text,
                  style: TextStyle(
                    color: taxtcolor,
                    fontSize: 20,
                    fontFamily: "Blabeloo",
                  ),
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 5,
                ),

                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Transform.translate(
                          offset: const Offset(0, 5),
                          child: SvgPicture.asset(
                            image,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Transform.translate(
                          offset: const Offset(0, 5),
                          child: SvgPicture.asset(
                            image2,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4.0,
                            color: isChecked(index)
                                ? chekecolor2
                                : ColorMain.color0Orange,
                          ),
                          color: chekecolor,
                        ),
                        child: Transform.scale(
                          scale: 2.5,
                          child: Checkbox(
                              value: isChecked(index),
                              checkColor: chekecolor2,
                              side: BorderSide.none,
                              shape: const CircleBorder(),
                              onChanged: (newBool) {}),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Transform.translate(
                          offset: const Offset(0, 5),
                          child: SvgPicture.asset(
                            image3,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 90,
                        child: Transform.translate(
                          offset: const Offset(0, 5),
                          child: SvgPicture.asset(
                            image4,
                          ),
                        ),
                      ),
                    ),
                    //
                    //
                    // Container(
                    //   height: 150,
                    //   width: 53,
                    //   child: OverflowBox(
                    //     maxHeight: 400,
                    //     maxWidth: 400,
                    //     minWidth: 40,
                    //     alignment: Alignment.bottomRight,
                    //     child: SvgPicture.asset(
                    //       image3,
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   height: 150,
                    //   width: 53,
                    //   child: OverflowBox(
                    //     maxHeight: 400,
                    //     maxWidth: 400,
                    //     minWidth: 50,
                    //     alignment: Alignment.bottomRight,
                    //     child: SvgPicture.asset(
                    //       image4,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(width: 100,),
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  //////Malik's codes

  int mistakes = 0;
  int levelsPassed = 0;
  int level = 1;
  double fill = 200;
  double opacity = 1.0;
  String word = 'Word';
  String remove = ' ';
  String replace = ' ';

  List buildList(
    String word,
    String letter,
  ) {
    List letters = [];
    for (var c in word.characters) {
      if (c == letter) {
        letters.add('    ');
      } else {
        letters.add(c);
      }
      ;
    }
    return letters;
  }

  String changeLetter(TextEditingController controller, String letter) {
    emit(AppLoadingLetterState());
    if (kDebugMode) {
      print(letter);
    }
    letter = controller.text;
    if (kDebugMode) {
      print(letter);
    }
    emit(AppLoadingLetterState());
    return letter;
  }

  String removeLetter(String word, String remove, {String replace = ' '}) {
    word = word.characters
        .replaceAll(remove.characters, replace.characters)
        .toString();
    return word;
  }

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<List<Levels>> getLetter() async {
    log('loading ====================');
    final snapshot = await _fireStore.collection("Levels").get();
    if (kDebugMode) {}
    final letter = snapshot.docs.map((e) {
      return Levels.fromSnapshot(e);
    }).toList();
    if (kDebugMode) {}
    log('loaded ====================');
    return letter;
  }

  Future<List<StoryModel>> getStory() async {
    log('loading ====================');
    final snapshot = await _fireStore.collection("Stories").get();
    if (kDebugMode) {}
    final story = snapshot.docs.map(
      (e) {
        return StoryModel.fromSnapshot(e);
      },
    ).toList();
    if (kDebugMode) {}
    log('loaded ====================');
    return story;
  }
  addMistakes(BuildContext context){
    AppCubit.get(context).mistakes = AppCubit.get(context).mistakes + 1;
    log('${AppCubit.get(context).mistakes}',name:'Cubit');
    if(AppCubit.get(context).mistakes == 3){
      emit(AppMistakeAddedState());
    }
  }
}
