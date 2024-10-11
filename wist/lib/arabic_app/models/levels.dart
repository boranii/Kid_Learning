import 'package:cloud_firestore/cloud_firestore.dart';

class Levels {
  final String? letter;
  final Map<String, dynamic>? firstLevel;
  final Map<String, dynamic>? secondLevel;
  final Map<String, dynamic>? thirdLevel;

  Levels(
      {
  required this.secondLevel,
      required this.thirdLevel,
      required this.letter,
      required this.firstLevel,
      }
      );

  toJson() {
    return {
      "letter": letter,
    };
  }

  factory Levels.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return Levels(
      letter: data?["letter"],
      firstLevel: data?["firstLevel"],
      secondLevel: data?["secondLevel"],
      thirdLevel: data?["thirdLevel"],
    );
  }
}
