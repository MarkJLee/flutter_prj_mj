import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_prj_mj/widgets/feeling.dart';
import 'package:flutter_prj_mj/widgets/mood.dart';

class PostModel {
  final String userId;
  final String postId;
  final String? text;
  final DateTime postTime;
  final Mood mood;
  final List<Feeling>? feeling;

  PostModel({
    required this.userId,
    required this.postId,
    this.text,
    required this.postTime,
    required this.mood,
    this.feeling,
  });

  PostModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        postId = json['postId'],
        text = json['text'] as String?,
        postTime = (json['postTime'] as Timestamp).toDate(),
        mood = Mood.values
            .firstWhere((e) => e.toString() == 'Mood.${json['mood']}'),
        feeling = json['feeling'] != null
            ? (json['feeling'] as List)
                .map((e) => Feeling.values
                    .firstWhere((f) => f.toString() == 'Feeling.$e'))
                .toList()
            : null;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'postId': postId,
        'text': text,
        'postTime': postTime,
        'mood': mood.toString().split('.').last,
        'feeling': feeling?.map((e) => e.toString().split('.').last).toList(),
      };
}
