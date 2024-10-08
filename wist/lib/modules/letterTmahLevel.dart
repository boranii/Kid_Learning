import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wist/modules/kasrahLevel.dart';

import '../my__icons_icons.dart';
import '../shard/components/components.dart';
import '../shard/styles/color.dart';
import 'chooseLetter.dart';
class LetterThmahLevel extends StatefulWidget {
  final int index;
  const LetterThmahLevel({super.key, required this.index});

  @override
  State<LetterThmahLevel> createState() => _LetterThmahLevelState();
}

class _LetterThmahLevelState extends State<LetterThmahLevel> {
  final player = AudioPlayer();

  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 0),
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
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: SvgPicture.asset(
                  "assets/222.svg",
                  alignment: Alignment.center,
                  height: 350,
                  width: 238,

                ),),
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
                        MaterialPageRoute(builder: (context) =>  ChooseLetter(index: widget.index,)));                  },
                  text: "التالي"),
            ],
          ),
        ),
      ),
    );
  }
}
