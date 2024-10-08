import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/levels.dart';

class FirestoreTest extends StatefulWidget {
  const FirestoreTest({super.key});

  @override
  State<FirestoreTest> createState() => _FirestoreTestState();
}




class _FirestoreTestState extends State<FirestoreTest> {
  FirebaseFirestore ff= FirebaseFirestore.instance;
  Future<List<Levels>> getLetter()async{
    final snapshot = await ff.collection("Levels").get();
    if(kDebugMode){
      print("99999999999");
    }
    final letter = snapshot.docs.map((e) {
      if(kDebugMode){
        // print(e);
        // print(FirstLevel.fromSnapshot(e).letter);
        // print(FirstLevel.fromSnapshot(e).firstLevel["image"]);
        // print("99999999999");
      }
      return Levels.fromSnapshot(e);
    }).toList();
    if(kDebugMode){
      print(letter[0]);
      print("=========");

    }

    return letter;
  }
  @override
  void initState() {
    getLetter();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:FutureBuilder(
          future: getLetter(),
          builder: (index,snapshot) {
            if(snapshot.connectionState == ConnectionState.done)
              {
                if(snapshot.hasData){
                  Levels? first = snapshot.data?[0];
                  if(kDebugMode){
                    print(first.toString());
                    print("++++++++++++");
                    // print(first.letter);
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: MaterialButton(onPressed: (){
                          setState(() {
                            initState();
                          },);
                        },
                          child:const Text("restart"),
                        ),
                      ),
                      Text(first?.letter??"hell",style:Theme.of(context).textTheme.headlineLarge),
                      // SvgPicture.network(first?.firstLevel?["image"]),
                    ],
                  );
                }
                else if(snapshot.hasError){
                  var first = snapshot.data;
                  if(kDebugMode){
                    print(first.toString());
                    // print(first.letter);
                  }
                  return Center(child: Text(
                   " ${snapshot.error.toString()} =======",),);
                }
                else{
                  return const Center(child: Text("Error",),);

                }
              }
            else{
              return const Center(child: CircularProgressIndicator(),);
            }
          },

        ),
      ),
    );
  }
}
