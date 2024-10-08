// import 'package:flutter/foundation.dart';
// import 'package:flutter/foundation.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/levels.dart';
import '../shard/cubit/cubit.dart';
import '../shard/cubit/states.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  int selected=-1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Center(
              child:Directionality(
                textDirection: TextDirection.rtl,
                child: FutureBuilder(
                  future: AppCubit.get(context).getLetter(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState== ConnectionState.done){
                      if(snapshot.hasData){
                        Levels? level = snapshot.data?[AppCubit.get(context).levelsPassed];
                        var chooseLetterLevel = level?.firstLevel?['missingLetter'];
                        List letters=AppCubit.get(context).buildList(chooseLetterLevel['word'],chooseLetterLevel['missingLetter']);
                        List items=chooseLetterLevel['randomLetters'];
                        return  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List<Widget>.generate(
                                letters.length,
                                    (i) => Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                      });
                                    },
                                    child: Text(
                                      letters[i] == '    ' ?AppCubit.get(context).remove:letters[i],
                                      style: Theme.of(context).textTheme.headlineLarge,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              spacing: 5.0,
                              runSpacing: 5.0,
                              children: List<Widget>.generate(items.length,(i) =>
                                  MaterialButton(
                                    color: selected==i?Colors.blue:Colors.white,
                                    onPressed: () {
                                      log('$selected');
                                      selected=i;
                                      AppCubit.get(context).remove=items[i];
                                      setState(() {
                                        log('$selected');
                                      });
                                      if(items[i] == chooseLetterLevel['missingLetter']){
                                        Future.delayed(const Duration(seconds: 5),(){
                                          Navigator.of(context).pushNamed('Map');
                                        });
                                      }
                                    },
                                    child: Text(
                                      items[i],
                                      style: Theme.of(context).textTheme.headlineLarge,
                                    ),
                                  ),),
                            ),
                          ],
                        );
                      }
                      else if(snapshot.hasError){
                        return Center(child: Text(
                          " ${snapshot.error.toString()} =======",),);
                      }
                      else{
                        return const Center(child: Text("Error",),);

                      }
                    }else {
                      return  const Center(child: CircularProgressIndicator(),);
                    }
                  },),
              ),
            ),
          ),
        );
      },
    );
  }
}
