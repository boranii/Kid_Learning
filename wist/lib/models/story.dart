import 'package:cloud_firestore/cloud_firestore.dart';

class StoryModel {
  final Map<String,dynamic>? firstPage;
  final Map<String,dynamic>? secondPage;
  final Map<String,dynamic>? thirdPage;
  final Map<String,dynamic>? fourthPage;
  final Map<String,dynamic>? fifthPage;

  StoryModel(  {
    required this.thirdPage,
    required this.fourthPage,
    required this.fifthPage,
    required this.firstPage,
    required this.secondPage,
  });

  factory StoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return StoryModel(
      firstPage: data?["1"],
      secondPage: data?["2"],
      thirdPage: data?["3"],
      fourthPage: data?["4"],
      fifthPage: data?["5"],
    );
  }

}
