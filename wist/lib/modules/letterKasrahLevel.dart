import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wist/modules/drawingPage.dart';

import '../my__icons_icons.dart';
import '../shard/components/components.dart';
import '../shard/styles/color.dart';
import 'chooseLetter.dart';
class LetterKasrahLevel extends StatefulWidget {
  final int index;
  const LetterKasrahLevel({super.key, required this.index});

  @override
  State<LetterKasrahLevel> createState() => _LetterKasrahLevelState();
}

class _LetterKasrahLevelState extends State<LetterKasrahLevel> {
  final player = AudioPlayer();

  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
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
            SvgPicture.asset(
              "assets/333.svg",
              width: 238,
              height: 390,
              alignment: Alignment.center,
            ),
            GestureDetector(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0,bottom: 10.0),
                    child: Text('$selectedIndex',style: TextStyle(fontSize: 35,fontWeight: FontWeight.w100,fontFamily: 'Blabeloo',color:colorprogres1 ,
                        decorationColor: taxtcolor
                    ),),
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
                  if (selectedIndex > 0) {
                    selectedIndex--;
                    player.play(AssetSource('a.mp3'));
                  }
                });

                print(selectedIndex);
              },
            ),


            // SizedBox(
            //   height: 20,
            // ),
            defultButton(
                pagename: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  ChooseLetter(index: widget.index,)));                },
                text: "التالي"),
          ],
        ),
      ),
    );
  }
}
