// import 'dart:developer';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// // ignore: unused_import
// import 'package:flutter_hooks/flutter_hooks.dart';
// // import 'package:wist/modules/map_level.dart';
// // import 'package:lottie/lottie.dart';
// // import 'package:wist/modules/onBoarding_screen.dart';
// import 'package:wist/my__icons_icons.dart';
// import '../../models/levels.dart';
// import '../../models/onboarding.dart';
// import '../../models/story.dart';
// import '../../shard/components/components.dart';
// import '../../shard/cubit/cubit.dart';
// import '../../shard/cubit/states.dart';
// import '../../shard/styles/color.dart';
//
// Widget onboarding(OnBoardingModel model) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     mainAxisSize: MainAxisSize.max,
//     children: [
//       const SizedBox(
//         height: 30,
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           SvgPicture.asset("assets/cloud.svg"),
//           SvgPicture.asset("assets/cloud.svg"),
//         ],
//       ),
//       // Lottie.asset("assets/lottie/Snoop.json",height: 100),
//       SvgPicture.asset(model.image),
//       // const SizedBox(height:70,),
//     ],
//   );
// }
//
// Widget onBoardingButton(
//     BuildContext context, Function() function, String title) {
//   return Container(
//     // margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/8 ,),
//     width: 200,
//     decoration: BoxDecoration(
//       color: ColorMain.colorOrange,
//       borderRadius: BorderRadius.circular(20),
//     ),
//     child: MaterialButton(
//       onPressed: function,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 fontFamily: "Blabeloo",
//                 color: Colors.white,
//                 fontSize: 25,
//               ),
//             ),
//             // const SizedBox(width:20),
//             const Icon(
//               My_Icons.arrows,
//               color: Colors.white,
//               weight: 50,
//               size: 20,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// Widget lockedLevel() => CircleAvatar(
//       radius: 40,
//       backgroundColor: ColorMain.colorOrange,
//       child: const Icon(
//         My_Icons.lock,
//         size: 40,
//         color: Colors.white,
//       ),
//     );
//
// Widget currentLevel(String letter) => CircleAvatar(
//       radius: 40,
//       backgroundColor: ColorMain.colorOrange,
//       child: CircleAvatar(
//         radius: 30,
//         backgroundColor: ColorMain.color0O,
//         child: Stack(
//           children: [
//             Center(
//               child: Text(
//                 letter,
//                 style: storyExTextStyle().copyWith(
//                   fontSize: 50,
//                   color: ColorMain.colorLBlue,
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: const Offset(40, -40),
//               child: SvgPicture.asset(
//                 'assets/Flag.svg',
//                 height: 100,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
// Widget finishedLevel() => CircleAvatar(
//       radius: 40,
//       backgroundColor: ColorMain.colorOrange,
//       child: CircleAvatar(
//         radius: 30,
//         backgroundColor: ColorMain.color0O,
//         child: SvgPicture.asset(
//           'assets/Flag.svg',
//           height: 100,
//         ),
//       ),
//     );
//
// class MapLevels extends StatelessWidget {
//   final int level;
//
//   const MapLevels({super.key, required this.level});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AppCubit, AppState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return FutureBuilder(
//             future: AppCubit.get(context).getLetter(),
//             builder: (context, snapshot) {
//               return ListView.builder(
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   if (index == 7 - level) {
//                     return Transform.translate(
//                       offset: Offset(index % 2 == 0 ? -50 : 50, 0),
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 60.0),
//                         child: InkWell(
//                           onTap: () {
//                             switch (index) {
//                               case 6:
//                                 Navigator.of(context).pushNamed('soundLevel');
//                               case 5:
//                                 Navigator.of(context).pushNamed('fathaLevel');
//                               case 4:
//                                 Navigator.of(context).pushNamed('thmahLevel');
//                               case 3:
//                                 Navigator.of(context).pushNamed('kasrahLevel');
//                               case 2:
//                                 Navigator.of(context).pushNamed('soundLevel');
//                               case 1:
//                                 Navigator.of(context).pushNamed('thmahLevel');
//                               case 0:
//                                 Navigator.of(context).pushNamed('kasrahLevel');
//                             }
//                           },
//                           child: currentLevel(snapshot.data?[0].letter ?? ""),
//                         ),
//                       ),
//                     );
//                   } else {
//                     if (index > 7 - level) {
//                       return Transform.translate(
//                         offset: Offset(index % 2 == 0 ? -50 : 50, 0),
//                         child: finishedLevel(),
//                       );
//                     } else {
//                       return Transform.translate(
//                         offset: Offset(index % 2 == 0 ? -50 : 50, 0),
//                         child: lockedLevel(),
//                       );
//                     }
//                   }
//                 },
//                 itemCount: 7,
//               );
//             });
//       },
//     );
//   }
// }
//
// Widget lettersOnTop({
//   double fill = 200,
//   dx = 0.0,
//   dy = 0.0,
//   opacity = 0.5,
//   h = 0.0,
//   w = 0.0,
//   required String character,
//   required String letter,
// }) {
//   return Opacity(
//     opacity: opacity,
//     child: Container(
//       width: 150,
//       height: 200,
//       // padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: ColorMain.color0Orange,
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(
//           color: ColorMain.colorOrange,
//           width: 5,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
//             height: fill,
//             width: 150,
//             decoration: BoxDecoration(
//               color: ColorMain.colorMain,
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(dx, dy),
//             child: SvgPicture.asset(
//               'assets/characters/$character.svg',
//             ),
//           ),
//           Center(
//             child: Transform.translate(
//               offset: Offset(w, h),
//               child: Text(
//                 letter,
//                 style: TextStyle(
//                   fontFamily: 'Blabeloo',
//                   fontSize: 100,
//                   color: ColorMain.colorLBlue,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget lettersBottom({
//   double fill = 200,
//   dx = 0.0,
//   dy = 0.0,
//   opacity = 0.5,
//   h = 0.0,
//   w = 0.0,
//   required String character,
//   required String letter,
// }) {
//   return Opacity(
//     opacity: opacity,
//     child: Container(
//       width: 150,
//       height: 200,
//       // padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: ColorMain.color0Orange,
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(
//           color: ColorMain.colorOrange,
//           width: 5,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
//             height: fill,
//             width: 150,
//             decoration: BoxDecoration(
//               color: ColorMain.colorMain,
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//           Center(
//             child: Transform.translate(
//               offset: Offset(w, h),
//               child: Text(
//                 letter,
//                 style: TextStyle(
//                   fontFamily: 'Blabeloo',
//                   fontSize: 100,
//                   color: ColorMain.colorLBlue,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           Transform.translate(
//             offset: Offset(dx, dy),
//             child: SvgPicture.asset(
//               'assets/characters/$character.svg',
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
//
// Widget lettersBehind({
//   double fill = 200,
//   dx = 0.0,
//   dy = 0.0,
//   opacity = 0.5,
//   h = 0.0,
//   w = 0.0,
//   required String character,
//   required String letter,
// }) {
//   return Opacity(
//     opacity: opacity,
//     child: Stack(
//       children: [
//         Transform.translate(
//           offset: Offset(dx, dy),
//           child: SvgPicture.asset(
//             'assets/characters/$character.svg',
//           ),
//         ),
//         Container(
//           width: 150,
//           height: 200,
//           // padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: ColorMain.color0Orange,
//             borderRadius: BorderRadius.circular(30),
//             border: Border.all(
//               color: ColorMain.colorOrange,
//               width: 5,
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(horizontal: fill == 20 ? 10 : 0),
//                 height: fill,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   color: ColorMain.colorMain,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               Center(
//                 child: Transform.translate(
//                   offset: Offset(w, h),
//                   child: Text(
//                     letter,
//                     style: TextStyle(
//                       fontFamily: 'Blabeloo',
//                       fontSize: 100,
//                       color: ColorMain.colorLBlue,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// Widget specialLevel({
//   required String character1,
//   required String letters,
//   required String character2,
//   dx1 = 0.0,
//   dy1 = 0.0,
//   dx2 = 0.0,
//   dy2 = 0.0,
//   dx3 = 0.0,
//   dy3 = 0.0,
//   opacity = 0.5,
//   bool size = false,
//   bool flip1 = false,
//   bool flip2 = false,
// }) {
//   return Opacity(
//     opacity: opacity,
//     child: Container(
//       width: 330,
//       height: 140,
//       decoration: BoxDecoration(
//         color: ColorMain.color0Orange,
//         borderRadius: BorderRadius.circular(30),
//         border: Border.all(
//           color: ColorMain.colorOrange,
//           width: 5,
//         ),
//       ),
//       child: OverflowBox(
//         maxWidth: 410,
//         minWidth: 410,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Transform.flip(
//               flipX: flip1,
//               child: Transform.translate(
//                 offset: Offset(dx1, dy1),
//                 child: SvgPicture.asset(
//                   'assets/characters/$character1.svg',
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(dx2, dy2),
//               child: Text(
//                 letters,
//                 style: TextStyle(
//                   fontFamily: 'Blabeloo',
//                   fontSize: size ? 30 : 43,
//                   color: ColorMain.colorLBlue,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Transform.flip(
//               flipX: flip2,
//               child: Transform.translate(
//                 offset: Offset(dx3, dy3),
//                 child: SvgPicture.asset(
//                   'assets/characters/$character2.svg',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// Widget levelSize() => const SizedBox(height: 20);
//
// TextStyle storyTextStyle() => TextStyle(
//       fontWeight: FontWeight.bold,
//       fontFamily: 'Blabeloo',
//       fontSize: 19,
//       height: 1.5,
//       color: ColorMain.colorBlue,
//     );
//
// TextStyle storyExTextStyle() => TextStyle(
//       fontWeight: FontWeight.bold,
//       fontFamily: 'Blabeloo',
//       height: 1.5,
//       fontSize: 19,
//       color: Colors.blue.shade700,
//     );
//
// Widget levelRow(Widget widget1, widget2) => Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         widget1,
//         widget2,
//       ],
//     );
//
// List<StoryModel> stories = [
//   StoryModel(
//       character: 'assets/story/Girl.svg',
//       text: '...رنب',
//       backgroundImage: 'assets/story/StoryBackground.svg',
//       textAfter: ' يعيش في بيت مريح',
//       textBefore: 'كان هناك '),
//   StoryModel(
//       character: 'assets/story/Girl2.svg',
//       text: '...لى',
//       backgroundImage: 'assets/story/StoryBackground2.svg',
//       textAfter: 'المرج ليأكل الجزر الطازج.',
//       textBefore: 'كل يوم، كان الأرنب يقفز'),
//   StoryModel(
//       character: 'assets/story/Girl3.svg',
//       text: ' ر...ى',
//       backgroundImage: 'assets/story/StoryBackground3.svg',
//       textAfter: 'الارنب تفاحة حمراء طرية. ',
//       textBefore: 'بعد ظهر أحد الأيام المشمسة، '),
//   StoryModel(
//       character: 'assets/story/Girl4.svg',
//       text: 'التف.... حة',
//       backgroundImage: 'assets/story/StoryBackground4.svg',
//       textAfter: ' ',
//       textBefore: 'قفز الارنب وأخذ قضمة كبيرة من '),
//   StoryModel(
//       character: 'assets/story/Girl5.svg',
//       text: 'ال...نتهاء',
//       backgroundImage: 'assets/story/StoryBackground5.svg',
//       textAfter:
//           ' من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',
//       textBefore: 'بعد '),
// ];
//
// Widget storyTemplate(BuildContext context, StoryModel story) {
//   return Stack(
//     children: [
//       SvgPicture.asset(
//         story.backgroundImage,
//         // 'assets/story/StoryBackground.svg',
//         fit: BoxFit.cover,
//       ),
//       Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 30.0,
//               top: 30.0,
//             ),
//             child: CircleAvatar(
//               backgroundColor: ColorMain.colorOrange,
//               radius: 30,
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 icon: const Padding(
//                   padding: EdgeInsets.only(right: 10.0),
//                   child: Icon(
//                     My_Icons.buttonarrowleft,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height / 3,
//             decoration: BoxDecoration(
//               color: ColorMain.colorMain,
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(40), topRight: Radius.circular(40)),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Transform.translate(
//                   offset: const Offset(0.0, -20.0),
//                   child: SvgPicture.asset(
//                     story.character,
//                     // 'assets/story/Girl.svg',
//                   ),
//                 ),
//                 Container(
//                   // color:Colors.red,
//                   width: MediaQuery.of(context).size.width / 2.5,
//                   height: MediaQuery.of(context).size.height / 4,
//                   padding: const EdgeInsets.only(
//                     right: 30.0,
//                     top: 10.0,
//                   ),
//                   child: Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: Wrap(
//                       children: [
//                         Text(
//                           story.textBefore,
//                           // 'بعد ',
//                           style: storyTextStyle(),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             if (kDebugMode) {
//                               print('hello');
//                             }
//                           },
//                           child: Container(
//                             color: ColorMain.colorBlue.withOpacity(0.5),
//                             child: Text(
//                               story.text,
//                               style: storyExTextStyle(),
//                             ),
//                           ),
//                         ),
//                         Text(
//                           story.textAfter,
//                           // ' من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',
//                           style: storyTextStyle(),
//                         ),
//                       ],
//                     ),
//                     // RichText(text:
//                     // TextSpan(
//                     //    children: [
//                     //      TextSpan(text: 'بعد ',style:storyTextStyle(),),
//                     //      TextSpan(text: 'ال نتهاء',style:storyExTextStyle(),),
//                     //      TextSpan(text: ' من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',style:storyTextStyle()),
//                     //    ],
//                     // ),
//                     // ),
//
//                     // Text('بعد ال...نتهاء من تناول التفاحة، عاد الأرنب إلى المنزل ليأخذ قيلولة طويلة لطيفة.',textAlign: TextAlign.start,style: TextStyle(
//                     //   fontSize:20,
//                     //   fontWeight: FontWeight.bold,
//                     //   color:ColorMain.colorBlue,
//                     // ),),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
// // Widget levelTemplate({required Future<List<Levels>?>? future,required int levelIndex,required String levelType,required Widget widget}){
// //   return FutureBuilder(
// //     future: future,
// //     builder: (context, snapshot) {
// //       if(snapshot.connectionState== ConnectionState.done){
// //         if(snapshot.hasData){
// //           Levels? level = snapshot.data?[0];
// //           var soundLevel = level?.firstLevel?[levelType];
// //           return Padding(
// //             padding: const EdgeInsets.only(top: 0),
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.only(
// //                     top: 30.0,
// //                     left: 20.0,
// //                     right: 20.0,
// //                   ),
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       CircleAvatar(
// //                         backgroundColor: ColorMain.colorOrange,
// //                         radius: 30,
// //                         child: IconButton(
// //                           onPressed: () {
// //                             Navigator.of(context).pop();
// //                           },
// //                           icon: const Padding(
// //                             padding: EdgeInsets.only(right: 10.0),
// //                             child: Icon(
// //                               My_Icons.buttonarrowleft,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       progras(width: 60),
// //                       CircleAvatar(
// //                         backgroundColor: ColorMain.colorOrange,
// //                         radius: 30,
// //                         child: Padding(
// //                           padding: const EdgeInsets.only(right: 10.0),
// //                           child: IconButton(
// //                             onPressed: () {},
// //                             icon: const Icon(
// //                               My_Icons.buttonarrowright,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SvgPicture.network(
// //                   soundLevel['image'],
// //                   height: 350,
// //                 ),
// //                 // SizedBox(
// //                 //   height: 10,
// //                 // ),
// //                 GestureDetector(
// //                   child: Stack(
// //                     children: [
// //                       Padding(
// //                         padding: const EdgeInsets.only(
// //                             left: 60.0, bottom: 10.0),
// //                         child: Text(
// //                           '$selectedIndex',
// //                           style: TextStyle(
// //                               fontSize: 35,
// //                               fontWeight: FontWeight.w100,
// //                               fontFamily: 'Blabeloo',
// //                               color: colorprogres1,
// //                               decorationColor: taxtcolor),
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.only(top: 10.0),
// //                         child: SvgPicture.asset(
// //                           "assets/microphone.svg",
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   onTap: () {
// //                     setState(() {
// //                       if (selectedIndex > 0) {
// //                         selectedIndex--;
// //                         player.play(UrlSource(soundLevel['audio'])).then((on) {
// //                           if (kDebugMode) {
// //                             print('good');
// //                           }
// //                         }).catchError((onError){
// //                           if (kDebugMode) {
// //                             print('bad $onError');
// //                           }
// //                         });
// //                       }
// //                     });
// //
// //                     print(selectedIndex);
// //                   },
// //                 ),
// //                 // SizedBox(
// //                 //   height: 100,
// //                 // ),
// //                 defultButton(
// //                     pagename: () {
// //                       Navigator.pushNamed(context, 'Drawing');
// //                     },
// //                     text: "التالي"),
// //               ],
// //             ),
// //           );
// //         }
// //         else if(snapshot.hasError){
// //           return Center(child: Text(
// //             " ${snapshot.error.toString()} =======",),);
// //         }
// //         else{
// //           return const Center(child: Text("Error",),);
// //
// //         }
// //       }else {
// //         return  const Center(child: CircularProgressIndicator(),);
// //       }
// //     },);
// // }
//
// // class SoundLevel extends StatefulWidget {
// //   final int level;
// //
// //   const SoundLevel({super.key, required this.level});
// //
// //   @override
// //   State<SoundLevel> createState() => _SoundLevelState();
// // }
// //
// // class _SoundLevelState extends State<SoundLevel> {
// //   final player = AudioPlayer();
// //
// //   int selectedIndex = 3;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocConsumer<AppCubit, AppState>(
// //       listener: (context, state) {},
// //       builder: (context, state) {
// //         return SafeArea(
// //           child: Scaffold(
// //             body: Center(
// //               child: Container(
// //                 width: double.infinity,
// //                 color: colormain,
// //                 child: FutureBuilder(
// //                   future: AppCubit.get(context).getLetter(),
// //                   builder: (context, snapshot) {
// //                     if (snapshot.connectionState == ConnectionState.done) {
// //                       if (snapshot.hasData) {
// //                         Levels? level = snapshot.data?[widget.level];
// //                         var soundLevel = level?.firstLevel?['soundLevel'];
// //                         return Padding(
// //                           padding: const EdgeInsets.only(top: 0),
// //                           child: Column(
// //                             mainAxisAlignment: MainAxisAlignment.center,
// //                             children: [
// //                               Expanded(
// //                                 child: Row(
// //                                   mainAxisAlignment:
// //                                       MainAxisAlignment.spaceBetween,
// //                                   children: [
// //                                     CircleAvatar(
// //                                       backgroundColor: ColorMain.colorOrange,
// //                                       radius: 30,
// //                                       child: IconButton(
// //                                         onPressed: () {
// //                                           Navigator.of(context).pop();
// //                                         },
// //                                         icon: const Padding(
// //                                           padding: EdgeInsets.only(right: 10.0),
// //                                           child: Icon(
// //                                             My_Icons.buttonarrowleft,
// //                                             color: Colors.white,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                     progras(width: 60),
// //                                     CircleAvatar(
// //                                       backgroundColor: ColorMain.colorOrange,
// //                                       radius: 30,
// //                                       child: Padding(
// //                                         padding:
// //                                             const EdgeInsets.only(right: 10.0),
// //                                         child: IconButton(
// //                                           onPressed: () {},
// //                                           icon: const Icon(
// //                                             My_Icons.buttonarrowright,
// //                                             color: Colors.white,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                               Center(
// //                                 child: SvgPicture.network(
// //                                   soundLevel['image'],
// //                                   placeholderBuilder: (context) => Text('الحرف',
// //                                       style: Theme.of(context)
// //                                           .textTheme
// //                                           .headlineLarge),
// //                                   height: 350,
// //                                 ),
// //                               ),
// //                               GestureDetector(
// //                                 child: Stack(
// //                                   children: [
// //                                     Padding(
// //                                       padding: const EdgeInsets.only(
// //                                           left: 60.0, bottom: 10.0),
// //                                       child: Text(
// //                                         '$selectedIndex',
// //                                         style: TextStyle(
// //                                             fontSize: 35,
// //                                             fontWeight: FontWeight.w100,
// //                                             fontFamily: 'Blabeloo',
// //                                             color: colorprogres1,
// //                                             decorationColor: taxtcolor),
// //                                       ),
// //                                     ),
// //                                     Padding(
// //                                       padding: const EdgeInsets.only(top: 10.0),
// //                                       child: SvgPicture.asset(
// //                                         "assets/microphone.svg",
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                                 onTap: () {
// //                                   setState(() {
// //                                     if (selectedIndex > 0) {
// //                                       selectedIndex--;
// //                                       player
// //                                           .play(UrlSource(soundLevel['audio']))
// //                                           .then((on) {
// //                                         if (kDebugMode) {
// //                                           print('good');
// //                                         }
// //                                       }).catchError((onError) {
// //                                         if (kDebugMode) {
// //                                           print('bad $onError');
// //                                         }
// //                                       });
// //                                     }
// //                                   });
// //
// //                                   print(selectedIndex);
// //                                 },
// //                               ),
// //                               defultButton(
// //                                   pagename: () {
// //                                     Navigator.pushNamed(
// //                                       context,
// //                                       'Drawing',
// //                                     );
// //                                   },
// //                                   text: "التالي"),
// //                             ],
// //                           ),
// //                         );
// //                       } else if (snapshot.hasError) {
// //                         return Center(
// //                           child: Text(
// //                             " ${snapshot.error.toString()} =======",
// //                           ),
// //                         );
// //                       } else {
// //                         return const Center(
// //                           child: Text(
// //                             "Error",
// //                           ),
// //                         );
// //                       }
// //                     } else {
// //                       return const Center(
// //                         child: CircularProgressIndicator(),
// //                       );
// //                     }
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
//
// // Widget futureCall(BuildContext context,
// //         {required int index, required Widget widget}) =>
// //     FutureBuilder(
// //       future: AppCubit.get(context).getLetter(),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.done) {
// //           if (snapshot.hasData) {
// //             Levels? level = snapshot.data?[index];
// //             var soundLevel = level?.firstLevel?['soundLevel'];
// //             return widget;
// //           } else if (snapshot.hasError) {
// //             return Center(
// //               child: Text(
// //                 " ${snapshot.error.toString()} =======",
// //               ),
// //             );
// //           } else {
// //             return const Center(
// //               child: Text(
// //                 "Error",
// //               ),
// //             );
// //           }
// //         } else {
// //           return const Center(
// //             child: CircularProgressIndicator(),
// //           );
// //         }
// //       },
// //     );
//
// class Mic extends StatefulWidget {
//   Mic({super.key, required this.index, required this.soundLevel});
//
//   late int index;
//   late Map<String, dynamic> soundLevel;
//
//   @override
//   State<Mic> createState() => _MicState();
// }
//
// class _MicState extends State<Mic> {
//   final player = AudioPlayer();
//   bool enabled = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 60.0, bottom: 10.0),
//                 child: Text(
//                   '${widget.index}',
//                   style: TextStyle(
//                     fontSize: 35,
//                     fontWeight: FontWeight.w100,
//                     fontFamily: 'Blabeloo',
//                     color: colorprogres1,
//                     decorationColor: taxtcolor,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//                 child: SvgPicture.asset(
//                   "assets/microphone.svg",
//                 ),
//               ),
//             ],
//           ),
//           onTap: () {
//             setState(() {
//               if (widget.index > 0) {
//                 player
//                     .play(
//                   UrlSource(
//                     widget.soundLevel['audio'],
//                   ),
//                 )
//                     .then(
//                   (on) {
//                     widget.index = widget.index - 1;
//                     log('good',name:'good response');
//                     log('${widget.index}');
//                   },
//                 ).catchError(
//                   (onError) {
//                     log(
//                       'bad ============== ===== $onError',name: 'error'
//                     );
//                   },
//                 );
//               } else {
//                 enabled = true;
//               }
//             });
//           },
//         ),
//         defultButton(
//           enabled: enabled,
//           pagename: () {
//             if (widget.index == 0) {
//               Navigator.pushNamed(
//                 context,
//                 'Drawing',
//               );
//             } else {
//               log('not yet');
//             }
//           },
//           text: "التالي",
//         ),
//       ],
//     );
//   }
// }
