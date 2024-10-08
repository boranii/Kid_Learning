import 'package:wist/modules/chooseLetter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wist/modules/fathaLevel.dart';
import 'package:wist/modules/kasrahLevel.dart';
import 'package:wist/modules/letterFathaLevel.dart';
import 'package:wist/modules/letterKasrahLevel.dart';
import 'package:wist/modules/letterTmahLevel.dart';
import 'package:wist/modules/soundLevel.dart';
import 'package:wist/modules/splash_screen.dart';
import 'package:wist/modules/drawingPage.dart';
import 'package:wist/modules/thmahLevel.dart';
import 'package:wist/shard/cubit/cubit.dart';
import 'package:wist/shard/styles/color.dart';
import 'firebase_options.dart';
import 'modules/Map_level.dart';
import 'modules/level.dart';
import 'modules/onBoarding_screen.dart';
import 'modules/story_level.dart';
// import 'modules/story.dart';
// import 'modules/test/letter_tracing.dart';
// import 'modules/test/succesDialog.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        title: 'حروف مرحة',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          tabBarTheme: TabBarTheme(
            labelColor: ColorMain.colorOrange,
            unselectedLabelColor: ColorMain.color0Orange,
            labelStyle: const TextStyle(
              fontFamily: 'Blabeloo',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Blabeloo',
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                color: ColorMain.colorOrange,
                width: 2,
              ),
            ),
            tabAlignment: TabAlignment.center,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          primarySwatch: maintheme,
          scaffoldBackgroundColor:
          ColorMain.colorMain,
          useMaterial3: false,
        ),
        home: const SplashScreen(),
        routes: {
          "splash": (context) =>  const SplashScreen(),
          "onboarding": (context) =>  const OnBoardingScreen(),
          // "Levels": (context) =>  const Levels(level:1),
          // "Drawing": (context) =>  const Draw(),
          // "Map": (context) =>  MapLevel(level:8,levelIndex:1),
          "Story": (context) =>  const Levels(level:0),
          "StoryLevel": (context) =>  const StoryLevel(),
          "soundLevel": (context) => const SoundLevel(index: 1,),
          // "chooseLetter": (context) => const ChooseLetter(),
          // "fathaLevel": (context) => const FathaLevel(),
          // "kasrahLevel": (context) => const KasrahLevel(),
          // "thmahLevel": (context) => const ThmahLevel(),
          // "letterFathaLevel": (context) => const LetterFathaLevel(),
          // "letterKasrahLevel": (context) => const LetterKasrahLevel(),
          // "letterThmahLevel": (context) => const LetterThmahLevel(),
        },
      ),
    );
  }
}

