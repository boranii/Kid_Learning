// ignore_for_file: file_names, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wist/arabic_app/modules/level.dart'as l;
import '../models/onboarding.dart';
import '../shard/components/components.dart';
import '../shard/styles/color.dart';
import 'package:wist/my__icons_icons.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();

  List<OnBoardingModel> boarding = [
    OnBoardingModel(image: 'assets/BoyWithComment.svg'),
    OnBoardingModel(image: 'assets/GirlWithComment.svg'),
    OnBoardingModel(image: 'assets/BoyAndGirlWithComment.svg'),
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    // print('is last');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    // print('not last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardController,
                itemBuilder: (context, index) => onboarding(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            defultButton(pagename:  () {
              if (isLast) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const l.Levels(level: 1)),);
              }else {
                boardController.nextPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastLinearToSlowEaseIn);
              }
            }, text: isLast ? 'هيا نبداء':'التالي'),
            // onBoardingButton(context, () {
            //   if (isLast) {
            //     Navigator.of(context).pushReplacementNamed('Levels',);
            //   }else {
            //     boardController.nextPage(
            //         duration: const Duration(
            //           milliseconds: 750,
            //         ),
            //         curve: Curves.fastLinearToSlowEaseIn);
            //   }
            // },!isLast ? 'التالي':'هيا نبداء'),
            const SizedBox(
              height: 10,
            ),
            SmoothPageIndicator(
              controller: boardController,
              effect: ExpandingDotsEffect(
                activeDotColor: ColorMain.colorOrange,
                dotColor: ColorMain.color0Orange,
              ),
              count: boarding.length,
            ),
          ],
        ),
      ),
    );
  }
}
