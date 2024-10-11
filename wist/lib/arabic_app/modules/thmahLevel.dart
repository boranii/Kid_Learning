import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../my__icons_icons.dart';
import '../shard/components/components.dart';
import '../shard/styles/color.dart';
import 'letterTmahLevel.dart';
class ThmahLevel extends StatefulWidget {
  final int index;
  const ThmahLevel({super.key, required this.index});

  @override
  State<ThmahLevel> createState() => _ThmahLevelState();
}

class _ThmahLevelState extends State<ThmahLevel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              "assets/2.svg",
              width: 238,
              height: 250,
              alignment: Alignment.center,
            ),),
              // SizedBox(
              //   height: 10,
              // ),
              Container(
                // height: 190,
                // width: 250,
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  "assets/2222.svg",
                ),
              ),
      
      
              // SizedBox(
              //   height: 0,
              // ),
              defultButton(
                  pagename: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LetterThmahLevel(index: widget.index),),);
                  },
                  text: "التالي"),
            ],
          ),
        ),
      ),
    );
  }
}
