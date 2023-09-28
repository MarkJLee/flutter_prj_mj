import 'package:flutter/material.dart';

enum Mood {
  veryUnpleasant,
  unpleasant,
  slightlyUnpleasant,
  neutral,
  slightlyPleasant,
  pleasant,
  veryPleasant,
}

extension MoodExtension on Mood {
  String get name {
    switch (this) {
      case Mood.veryUnpleasant:
        return 'Very Unpleasant';
      case Mood.unpleasant:
        return 'Unpleasant';
      case Mood.slightlyUnpleasant:
        return 'Slightly Unpleasant';
      case Mood.neutral:
        return 'Neutral';
      case Mood.slightlyPleasant:
        return 'Slightly Pleasant';
      case Mood.pleasant:
        return 'Pleasant';
      case Mood.veryPleasant:
        return 'Very Pleasant';
    }
  }
}

final List<Color> moodColors = [
  Colors.purple.shade500,
  Colors.blue.shade600,
  Colors.blue.shade400,
  Colors.cyan,
  Colors.lightGreen,
  Colors.green,
  Colors.orange,
];
